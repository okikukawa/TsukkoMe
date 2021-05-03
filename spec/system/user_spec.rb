require 'rails_helper'
RSpec.describe 'ユーザー機能' ,type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @situation = FactoryBot.create(:situation, user: @user2)
    @tsukkomi = FactoryBot.create(:tsukkomi, situation: @situation, user: @user1)
  end
  describe '新規ユーザー作成' do
    context '新しくユーザーを作成した場合' do
      it '登録完了のフラッシュメッセージが表示される' do
        visit new_user_registration_path
        fill_in 'ニックネーム', with: 'ボブ'
        fill_in 'Eメール', with: 'bob@bob.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認用）', with: 'password'
        click_button '登録'
        visit situations_path
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end
  describe 'ログインに関する処理' do
    before do
      visit new_user_session_path
      fill_in 'Eメール', with: 'user1@test.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    context 'ログインした場合' do
      it 'ログイン完了のフラッシュメッセージが表示される' do
        visit situations_path
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'ログアウトした場合' do
      it 'ログアウト完了のフラッシュメッセージが表示される' do
        click_link 'ログアウト'
        visit situations_path
        expect(page).to have_content 'ログアウトしました。'
      end
    end
    context 'マイページに遷移した場合' do
      before  do
        visit user_path(@user1)
      end
      it 'ログイン中のユーザー名が表示される' do
        expect(page).to have_content 'ユーザー1'
      end
      it '投稿済みのツッコミが表示される' do
        expect(page).to have_content 'ツッコミ1'
      end
      it 'お気に入りしたツッコミが表示される' do
        visit situation_tsukkomi_path(@situation, @tsukkomi)
        click_link 'favorite-icon'
        visit user_path(@user1)
        click_link 'ナイスツッコミ！'
        expect(page).to have_content 'ツッコミ1'
      end
    end
    context '他のユーザーページに遷移した場合' do
      before do
        visit user_path(@user2)
      end
      it '遷移先のユーザー名が表示される' do
        expect(page).to have_content 'ユーザー2'
      end
      it '編集ボタンは表示されない' do
        expect(page).not_to have_content '編集'
      end
    end
    context 'ユーザー情報を編集した場合' do
      it '編集したユーザー情報が表示される' do
        visit edit_user_registration_path(@user1)
        fill_in 'ニックネーム', with: 'アリス'
        fill_in 'Eメール', with: 'alice@alice.com'
        fill_in 'プロフィール', with: 'こんにちは！'
        fill_in 'user_current_password', with: 'password'
        click_button '更新する'
        visit user_path(@user1)
        expect(page).to have_content 'アリス'
        expect(page).to have_content 'こんにちは！'
      end
    end
  end
end
