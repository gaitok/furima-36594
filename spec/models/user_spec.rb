require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録のテストコード' do
    it 'ニックネームが空だと入力できない' do
      user = User.new(nickname: '', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: 'あ',
                      last_name: 'あ', first_name_kana: 'ア', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと入力できない' do
      user = User.new(nickname: 'a', email: '', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: 'あ', last_name: 'あ',
                      first_name_kana: 'ア', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'パスワードが空だと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: '', password_confirmation: 'aaaaa0', first_name: 'あ',
                      last_name: 'あ', first_name_kana: 'ア', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワード(確認)が一致しないと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: '', first_name: 'あ',
                      last_name: 'あ', first_name_kana: 'ア', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'お名前(全角)苗字が空だと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: '',
                      last_name: 'あ', first_name_kana: 'ア', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(全角)名前が空だと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: 'あ',
                      last_name: '', first_name_kana: 'ア', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'お名前カナ(全角)苗字が空だと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: 'あ',
                      last_name: 'あ', first_name_kana: '', last_name_kana: 'ア', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前カナ(全角)名前が空だと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: 'あ',
                      last_name: 'あ', first_name_kana: 'ア', last_name_kana: '', birthday: '1931-01-01 00:00:00')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it '生年月日が空だと入力できない' do
      user = User.new(nickname: 'a', email: 'aaa@aaa', password: 'aaaaa0', password_confirmation: 'aaaaa0', first_name: 'あ',
                      last_name: 'あ', first_name_kana: 'ア', last_name_kana: 'ア', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
