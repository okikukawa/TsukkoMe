require 'rails_helper'
RSpec.describe Situation, type: :model do
  describe '新規作成機能' do
    context 'phraseを空で登録した場合' do
      it 'バリデーションに引っかかる' do
        tsukkomi = Tsukkomi.new(phrase: "")
        tsukkomi.valid?
        expect(tsukkomi.errors.messages[:phrase]).to include('を入力してください')
        binding.irb
      end
    end
  end
end
