require 'rails_helper'
RSpec.describe Situation, type: :model do
  describe '新規作成機能' do
    context 'phraseを空で登録した場合' do
      it 'バリデーションに引っかかる' do
        tsukkomi = Tsukkomi.create(phrase: "")
        expect(tsukkomi).not_to be_valid
      end
    end
    context 'phraseを空文字で登録した場合' do
      it 'バリデーションに引っかかる' do
        tsukkomi = Tsukkomi.create(phrase: " ")
        expect(tsukkomi).not_to be_valid
      end
    end
  end
end
