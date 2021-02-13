class Situation < ApplicationRecord
  validates :title, presence: true
  has_many :tsukkomis, dependent: :destroy
  belongs_to :user
  scope :sort_created_at, -> { order(created_at: "DESC") }
end
