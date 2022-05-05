require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context '招待状の登録ができるとき' do
    it '正しい情報を入力すれば登録ができ入力完了ページに移動する' do
      #トップページに移動する
      basic_pass root_path
      visit root_path
      # トップページに招待状へ回答するページへ遷移するボタンがあることを確認する
      expect(page).to have_content('招待状に')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      #参列有無または他情報を入力する
      choose "user_attendance_出席"
      fill_in 'user_name', with: @user.name
      fill_in 'user_name_kana', with: @user.name_kana
      choose "user_bride_groom_新郎ゲスト"
      fill_in 'user_email', with: @user.email
      fill_in 'user_postal_code', with: @user.postal_code
      fill_in 'user_prefecture_code', with: @user.prefecture_code
      fill_in 'user_city', with: @user.city
      fill_in 'user_address', with: @user.address
      #確認するボタンを押下すると確認画面へ移動する
      find('input[name="commit"]').click
      #登録するボタンを押下するとDBに保存されていることを確認する
      expect do
        click_button "登録する"
      end.to change(User, :count).by(1)
      # 入力完了ページへ遷移したことを確認する
      expect(current_path).to eq(users_sign_up_complete_path)
    end
  end

  context '招待状の登録ができないとき' do
    it '誤った情報では招待状の登録ができず確認画面でエラーメッセージが表示される' do
      #トップページに移動する
      basic_pass root_path
      visit root_path
      # トップページに招待状へ回答するページへ遷移するボタンがあることを確認する
      expect(page).to have_content('招待状に')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      #参列有無または他情報を入力する
      fill_in 'user_name', with: ''
      fill_in 'user_name_kana', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_postal_code', with: ''
      fill_in 'user_prefecture_code', with: ''
      fill_in 'user_city', with: ''
      fill_in 'user_address', with: ''
      #確認するボタンを押下すると確認画面へ移動する
      find('input[name="commit"]').click
    end
  end
end
