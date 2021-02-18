require 'rails_helper'
RSpec.describe 'ツッコミ機能' ,type: :system do
  before do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user2)
    @situation = FactoryBot.create(:situation, user: user2)
    @tsukkomi = FactoryBot.create(:tsukkomi, situation: @situation, user: user)
  end
  describe '新規作成機能' do
    context 'ログインしている場合' do
      it '作成したツッコミが表示される' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'user1@test.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit new_situation_tsukkomi_path(@situation)
        fill_in 'tsukkomi_phrase', with: 'new_tsukkomi1'
        click_button '投稿する！'
        expect(page).to have_content 'new_tsukkomi1'
      end
    end
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        visit new_situation_tsukkomi_path(@situation)
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end
  describe '詳細画面' do
    before do
      visit new_user_session_path
      fill_in 'Eメール', with: 'user1@test.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    context '詳細画面に遷移した場合' do
      it 'ツッコミの詳細を確認できる' do
        visit situation_tsukkomi_path(@situation, @tsukkomi)
        expect(page).to have_content 'ツッコミ1'
      end
    end
    context 'ツッコミを編集した場合' do
      it '編集後のツッコミが表示される' do
        visit situation_tsukkomi_path(@situation, @tsukkomi)
        click_on 'dropdownMenu1'
        click_link '編集'
        fill_in 'tsukkomi_phrase', with: 'ツッコミ1！'
        click_button '更新'
        expect(page).to have_content 'ツッコミ1！'
      end
    end
    context 'ツッコミを削除した場合' do
      it 'ツッコミ詳細に表示されない' do
        visit situation_tsukkomi_path(@situation, @tsukkomi)
        click_on 'dropdownMenu1'
        page.accept_confirm do
          click_link '削除', href: situation_tsukkomi_path(@situation, @tsukkomi)
        end
        expect(page).not_to have_content 'ツッコミ1'
      end
    end
    context 'ツッコミをお気に入りした場合' do
      it 'フラッシュメッセージが表示される' do
        visit situation_tsukkomi_path(@situation, @tsukkomi)
        click_link 'favorite-icon'
        expect(page).to have_content 'ユーザー1さんのツッコミをお気に入り登録しました。'
      end
    end
    context 'ツッコミをお気に入り解除した場合' do
      it 'フラッシュメッセージが表示される' do
        visit situation_tsukkomi_path(@situation, @tsukkomi)
        click_link 'favorite-icon'
        click_link 'favorite-icon'
        expect(page).to have_content 'ユーザー1さんのツッコミをお気に入り解除しました。'
      end
    end
  end
  describe 'ツッコミ検索機能' do
    context '部分一致で検索した場合' do
      it '検索結果に一致したツッコミが表示される' do
        visit situation_path(@situation)
        fill_in 'q_phrase_cont', with: 'ツッコミ'
        click_button '検索'
        expect(page).to have_content 'ツッコミ1'
      end
    end
    context '検索結果が一致しない場合' do
      it 'ツッコミが表示されない' do
        visit situation_path(@situation)
        fill_in 'q_phrase_cont', with: 'ツッコミ3'
        click_button '検索'
        expect(page).not_to have_content 'ツッコミ1'
      end
    end
  end
end
