require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規作成機能' do
    context 'バリデーションチェック' do
      it '名前が空欄' do
        name_blank_user = User.new(name: "", email: "user@user.com", encrypted_password: "password")
        name_blank_user.valid?
        expect(name_blank_user.errors.messages[:name]).to include('を入力してください')
      end
      it 'メールアドレスが空欄' do
        email_blank_user = User.new(name: "user", email: "", encrypted_password: "password")
        email_blank_user.valid?
        expect(email_blank_user.errors.messages[:email]).to include('を入力してください')
      end
      it 'パスワードが空欄' do
        password_blank_user = User.new(name: "user", email: "user@test.com", password: "")
        password_blank_user.valid?
        expect(password_blank_user.errors.messages[:password]).to include('を入力してください')
      end
      it '名前が30文字より多い' do
        name_over_user = User.new(name: "あ" * 31, email: "user@user.com", encrypted_password: "password")
        name_over_user.valid?
        expect(name_over_user.errors.messages[:name]).to include('は30文字以内で入力してください')
      end
      it 'プロフィールが150文字より多い' do
        profile_over_user = User.new(name: "user", email: "user@user.com", encrypted_password: "password", profile: "あ" * 151)
        profile_over_user.valid?
        expect(profile_over_user.errors.messages[:profile]).to include('は150文字以内で入力してください')
      end
    end
  end
end
