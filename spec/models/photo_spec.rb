require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    user = FactoryBot.create(:user)
    @photo = FactoryBot.build(:photo,user_id: user.id)
  end

  describe '写真とテキストの投稿' do
    context '写真とテキストの投稿が出来るとき' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@photo).to be_valid
      end
    end

    context '写真とテキストの投稿が出来ないとき' do
      it 'ユーザーが紐づいていなければ投稿できない' do
        @photo.user_id = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include "Userを入力してください"
      end
      it '画像が空では登録できない' do
        @photo.image = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include "画像を選択してください"
      end
      it 'テキストが空では登録できない' do
        @photo.text = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include "メッセージを入力してください"
      end
    end
  end
end
