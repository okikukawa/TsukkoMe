require 'rails_helper'
RSpec.describe Tsukkomi, type: :model do
  describe '新規作成機能' do
    context 'phraseを空で登録した場合' do
      it 'バリデーションに引っかかる' do
        tsukkomi = Tsukkomi.new(phrase: "")
        tsukkomi.valid?
        expect(tsukkomi.errors.messages[:phrase]).to include('を入力してください。')
      end
    end
    context 'phraseを50文字より多く登録した場合' do
      it 'バリデーションに引っかかる' do
        tsukkomi = Tsukkomi.new(phrase: "あ" * 51)
        tsukkomi.valid?
        expect(tsukkomi.errors.messages[:phrase]).to include('は50文字以内で入力してください')
      end
    end
  end
end
