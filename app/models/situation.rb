class Situation < ApplicationRecord
  validates :title, presence: true
  has_many :tsukkomis
end
