require 'rails_helper'
RSpec.describe 'ツッコミ機能' ,type: :system do
  before do
    @situation = FactoryBot.create(:situation)
    @tsukkomi = FactoryBot.create(:tsukkomi, situation: @situation)
  end
  describe '新規作成機能' do
    context '新しくツッコミを作成した場合' do
      it '作成したツッコミが表示される' do
        visit situation_path(@situation)
        click_link 'ツッコミを作成する'
        fill_in 'Phrase', with: 'new_tsukkomi1'
        click_button '登録する'
        expect(page).to have_content 'new_tsukkomi1'
      end
    end
  end
  describe '詳細機能' do
    context '詳細画面に遷移した場合' do
      it 'ツッコミの詳細を確認できる' do
        visit situation_path(@situation)
        click_link 'ツッコミ1'
        expect(page).to have_content 'ツッコミ1'
      end
    end
  end
  describe '編集機能' do
    context 'ツッコミを編集した場合' do
      it '編集後のツッコミが表示される' do
        visit situation_path(@situation)
        click_link 'ツッコミ1'
        click_link '編集'
        fill_in 'Phrase', with: 'ツッコミ1！'
        click_button '更新する'
        expect(page).to have_content 'ツッコミ1！'
      end
    end
  end
  describe '削除機能' do
    context 'ツッコミを削除した場合' do
      it 'ツッコミ詳細に表示されない' do
        visit situation_path(@situation)
        click_link 'ツッコミ1'
        page.accept_confirm do
          click_link '削除', href: situation_tsukkomi_path(@situation, @tsukkomi)
        end
        expect(page).not_to have_content 'ツッコミ1'
      end
    end
  end
end
