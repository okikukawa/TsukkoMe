require 'rails_helper'
RSpec.describe 'シチュエーション機能' ,type: :system do
  before do
    user = FactoryBot.create(:user)
    FactoryBot.create(:situation, user: user)
    FactoryBot.create(:second_situation, user: user)
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのシチュエーションが表示される' do
        visit situations_path
        expect(page).to have_content 'シチュエーションのタイトル1'
      end
    end
  end
  describe '新規作成機能' do
    context 'ログインしている場合' do
      it '作成したシチュエーションが表示される' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'user1@test.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit new_situation_path
        fill_in 'situation_title', with: 'new_situation1'
        click_button '投稿する！'
        expect(page).to have_content 'new_situation1'
      end
    end
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        visit new_user_session_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
  describe '詳細機能' do
    context '詳細画面に遷移した場合' do
      it 'シチュエーションの詳細を確認できる' do
        situation = Situation.find_by(title: "シチュエーションのタイトル1")
        visit situation_path(situation)
        expect(page).to have_content 'シチュエーションのタイトル1'
      end
    end
  end
  describe '削除機能' do
    context 'シチュエーションを削除した場合' do
      it 'シチュエーション一覧に表示されない' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'user1@test.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        situation = Situation.find_by(title: "シチュエーションのタイトル1")
        visit situation_path(situation)
        click_link 'dropdownMenu1'
        page.accept_confirm do
          click_link '削除', href: situation_path(situation)
        end
        expect(page).not_to have_content 'シチュエーションのタイトル1'
      end
    end
  end
  describe 'ランダムシチュエーション表示機能（千本ノック）' do
    context 'ランダム表示画面に遷移した場合' do
      it 'シチュエーションが表示される' do
        visit thousand_fungo_situations_path
        expect(page).to have_content 'シチュエーションのタイトル1' or 'シチュエーションのタイトル2'
      end
    end
  end
end
