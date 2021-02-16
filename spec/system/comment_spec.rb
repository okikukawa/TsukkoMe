require 'rails_helper'
RSpec.describe 'コメント機能' ,type: :system do
  before do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user2)
    @situation = FactoryBot.create(:situation, user: user2)
    @tsukkomi = FactoryBot.create(:tsukkomi, situation: @situation, user: user2)
    @comment = FactoryBot.create(:comment, tsukkomi: @tsukkomi, user: user)
  end
  describe 'コメント機能' do
    before do
      visit new_user_session_path
      fill_in 'Eメール', with: 'user1@test.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      visit situation_tsukkomi_path(@situation, @tsukkomi)
    end
    context '新しくコメントを作成した場合' do
      it '作成したコメントが表示される' do
        fill_in 'comment_content', with: 'new_comment1'
        click_button 'コメントを投稿する'
        expect(page).to have_content 'new_comment1'
      end
    end
    context 'コメントを編集した場合' do
      it '編集後のコメントが表示される' do
        click_on 'dropdownMenu1'
        click_link '編集'
        fill_in 'comment-edit-field', with: 'edited_comment1'
        click_button '更新'
        expect(page).to have_content 'edited_comment1'
        expect(page).to have_content 'コメントを編集しました。'
      end
    end
    context 'コメントを削除した場合' do
      it '対象のコメントは表示されない' do
        click_on 'dropdownMenu1'
        page.accept_confirm do
          click_link '削除', href: situation_tsukkomi_comment_path(@situation, @tsukkomi, @comment)
        end
        expect(page).not_to have_content 'コメント1'
        expect(page).to have_content 'コメントを削除しました。'
      end
    end
  end
end
