require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(0.1)
  end

  describe '招待状の登録' do
    context 'ユーザーが招待状を登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @user.building = ''
        expect(@user).to be_valid
      end
      it 'allergyは空でも保存できること' do
        @user.allergy = ''
        expect(@user).to be_valid
      end
      it 'allergyは空でも保存できること' do
        @user.allergy = ''
        expect(@user).to be_valid
      end
      it 'busは空でも保存できること' do
        @user.bus = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが招待状を登録できないとき' do
      it 'attendanceが空では登録できない' do
        @user.attendance = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '出席または欠席を選択して下さい'
      end
      it 'bride_groomが空では登録できない' do
        @user.bride_groom = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '新郎ゲストまたは新婦ゲストを選択して下さい'
      end
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前を入力してください'
      end
      it 'nameが全角でなければ登録できない' do
        @user.name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前は不正な値です'
      end
      it 'name_kanaが空では登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前カナを入力してください'
      end
      it 'name_kanaが全角でなければ登録できない' do
        @user.name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'お名前カナは不正な値です'
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emaiは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'postal_codeが空では登録できない' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '郵便番号を入力してください'
      end
      it 'postal_codeがハイフンを含んだ正しい形式でないと登録ができないこと' do
        @user.postal_code = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include '郵便番号に(-)を入力してください'
      end
      it 'prefecture_codeが空では登録できない' do
        @user.prefecture_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '都道府県を入力してください'
      end
      it 'prefecture_codeが空では登録できない' do
        @user.prefecture_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '都道府県を入力してください'
      end
      it 'cityが空では登録できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '市区町村を入力してください'
      end
      it 'addressが空では登録できない' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '番地以降を入力してください'
      end
    end
  end
end
