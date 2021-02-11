require 'rails_helper'
RSpec.describe 'コメント機能' ,type: :system do
  before do
    user = FactoryBot.create(:user)
    @situation = FactoryBot.create(:situation, user: user)
    @tsukkomi = FactoryBot.create(:tsukkomi, situation: @situation, user: user)
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
        click_button '登録する'
        expect(page).to have_content 'new_comment1'
      end
    end
    # context 'コメントを編集した場合' do
    #   it '編集後のコメントが表示される' do
    #     visit edit_situation_tsukkomi_comment_path(@situation, @tsukkomi, @comment)
    #     fill_in 'comment_content', with: 'edited_comment1'
    #     click_button '更新する'
    #     expect(page).to have_content 'edited_comment1'
    #   end
    # end
    # context 'コメントを削除した場合' do
    #   it '対象のコメントは表示されない' do
    #   end
    # end
  end
end
