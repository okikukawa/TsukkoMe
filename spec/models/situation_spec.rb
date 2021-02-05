require 'rails_helper'
RSpec.describe Situation, type: :model do
  describe '新規作成機能' do
    context 'titleを空で登録した場合' do
      it 'バリデーションに引っかかる' do
        situation = Situation.create(title: "")
        expect(situation).not_to be_valid
      end
    end
  end
end
