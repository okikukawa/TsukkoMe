require 'rails_helper'
RSpec.describe 'シチュエーション機能' ,type: :system do
  before do
    FactoryBot.create(:situation)
    FactoryBot.create(:second_situation)
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのシチュエーションが表示される' do
        visit situations_path
        # save_and_open_page
        expect(page).to have_content 'シチュエーションのタイトル1'
      end
    end
  end
  describe '新規作成機能' do
    context '新しくシチュエーションを作成した場合' do
      it '作成したシチュエーションが表示される' do
        visit new_situation_path
        fill_in 'Title', with: 'new_situation1'
        click_button '登録する'
        expect(page).to have_content 'new_situation1'
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
        situation = Situation.find_by(title: "シチュエーションのタイトル2")
        visit situation_path(situation)
        page.accept_confirm do
          click_link '削除', href: situation_path(situation)
        end
        expect(page).not_to have_content 'シチュエーションのタイトル2'
      end
    end
  end
end
