class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum:500 }
  belongs_to :user
  belongs_to :tsukkomi
end
