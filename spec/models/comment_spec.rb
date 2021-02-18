require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe '新規作成機能' do
    context 'contentを空で登録した場合' do
      it 'バリデーションに引っかかる' do
        comment = Comment.new(content: "")
        comment.valid?
        expect(comment.errors.messages[:content]).to include('を入力してください')
      end
    end
    context 'contentを200文字より多く登録した場合' do
      it 'バリデーションに引っかかる' do
        comment = Comment.new(content: "あ" * 201 )
        comment.valid?
        expect(comment.errors.messages[:content]).to include('は200文字以内で入力してください')
      end
    end
  end
end
