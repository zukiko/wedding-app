require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'Photos', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @photo = FactoryBot.build(:photo)
  end

  context '写真の投稿ができるとき' do
    it '正しい情報を入力すれば投稿ができ写真一覧ページに移動する' do
      # ログインする
      basic_pass root_path
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      find('input[name="commit"]').click
      # 写真一覧ページへのボタンがあることを確認する
      expect(page).to have_content('PHOTO')
      # 写真一覧ページへ移動する
      visit photos_path
      # 写真投稿ページへのボタンがあることを確認する
      expect(page).to have_content('add_a_photo')
      # 投稿ページへ移動する
      visit new_photo_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('photo[image]', image_path, make_visible: true)
      # フォームに情報を入力する
      post = 'テスト'
      fill_in 'photo_text', with: post
      # 送信した内容がDBに保存されていることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Photo.count }.by(1)
      # 投稿が完了すると写真一覧ページに移動する
      expect(current_path).to eq(photos_path)
      # 写真一覧ページには先ほど投稿した内容が存在することを確認する（画像）
      expect(page).to have_selector('img')
      binding.pry
    end
  end

  context '写真の投稿ができないとき' do
    it '写真またはテキストが空の場合は、エラーメッセージが表示される' do
      # ログインする
      basic_pass root_path
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      find('input[name="commit"]').click
      # 写真一覧ページへのボタンがあることを確認する
      expect(page).to have_content('PHOTO')
      # 写真一覧ページへ移動する
      visit photos_path
      # 写真投稿ページへのボタンがあることを確認する
      expect(page).to have_content('add_a_photo')
      # 投稿ページへ移動する
      visit new_photo_path
      # DBに保存されていないことを確認する
      expect do
        find('input[name="commit"]').click
      end.not_to change { Photo.count }
    end
  end
end
