class Tsukkomi < ApplicationRecord
  validates :phrase, presence: true
  belongs_to :situation
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
end
