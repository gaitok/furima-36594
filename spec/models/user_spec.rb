require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録のテストコード' do
    context '新規登録できるとき' do
      it '全て値が入っている時' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空だと入力できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと入力できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが空だと入力できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは6文字以上での入力が必須' do
        @user.password = 'aaaa0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数のみを両方含む必要があります')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数のみを両方含む必要があります')
      end
      it '全角を含むパスワードでは登録できない' do
        @user.password = 'aaaa0０'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数のみを両方含む必要があります')
      end
      it 'パスワード(確認)が一致しないと入力できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)苗字が空だと入力できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)苗字に半角文字が含まれていると登録できない' do
        @user.first_name = '阿ｱアあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）の必要があります')
      end
      it 'お名前(全角)名前が空だと入力できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)名前に半角文字が含まれていると登録できない' do
        @user.last_name = '阿ｱアあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）の必要があります')
      end
      it 'お名前カナ(全角)苗字が空だと入力できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)苗字にカタカナ以外が含まれていると登録できない' do
        @user.first_name_kana = '阿ｱアあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角（カタカナ）のみの必要があります')
      end
      it 'お名前カナ(全角)名前が空だと入力できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)名前にカタカナ以外が含まれていると登録できない' do
        @user.last_name_kana = '阿ｱアあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角（カタカナ）のみの必要があります')
      end
      it '生年月日が空だと入力できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
