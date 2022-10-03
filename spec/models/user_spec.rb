require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、main_family_nameとmain_first_name、main_family_name_kanaとmain_first_name_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'main_family_nameが空では登録できない' do
        @user.main_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Main family name can't be blank")
      end
      it 'main_first_nameが空では登録できない' do
        @user.main_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Main first name can't be blank")
      end
      it 'main_family_nameが全角でないと登録できない' do
        @user.main_family_name = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include("Main family name is invalid")
      end
      it 'main_first_nameが全角でないと登録できない' do
        @user.main_first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Main first name is invalid")
      end
      it 'main_family_name_kanaが空では登録できない' do
        @user.main_family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Main family name kana can't be blank")
      end
      it 'main_first_name_kanaが空では登録できない' do
        @user.main_first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Main first name kana can't be blank")
      end
      it 'main_family_name_kanaが全角(カタカナ)でないと登録できない' do
        @user.main_family_name_kana = '佐とu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Main family name kana is invalid")
      end
      it 'main_first_nameが全角(カタカナ)でないと登録できない' do
        @user.main_first_name_kana = '太ろu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Main first name kana is invalid")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
