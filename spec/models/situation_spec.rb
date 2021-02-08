require 'rails_helper'
RSpec.describe Situation, type: :model do
  describe '新規作成機能' do
    context 'titleを空で登録した場合' do
      it 'バリデーションに引っかかる' do
        situation = Situation.new(title: "")
        situation.valid?
        expect(situation.errors.messages[:title]).to include('を入力してください')
      end
    end
  end
end
