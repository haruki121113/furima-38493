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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスword123'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'main_family_nameが空では登録できない' do
        @user.main_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'main_first_nameが空では登録できない' do
        @user.main_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'main_family_nameが全角でないと登録できない' do
        @user.main_family_name = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it 'main_first_nameが全角でないと登録できない' do
        @user.main_first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it 'main_family_name_kanaが空では登録できない' do
        @user.main_family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'main_first_name_kanaが空では登録できない' do
        @user.main_first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'main_family_name_kanaが全角(カタカナ)でないと登録できない' do
        @user.main_family_name_kana = '佐とu'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)は不正な値です")
      end
      it 'main_first_nameが全角(カタカナ)でないと登録できない' do
        @user.main_first_name_kana = '太ろu'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
