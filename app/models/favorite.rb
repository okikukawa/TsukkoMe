class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tsukkomi
  scope :sort_created_at, -> { order(created_at: "DESC") }
end
