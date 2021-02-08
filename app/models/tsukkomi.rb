class Tsukkomi < ApplicationRecord
  validates :phrase, presence: true
  belongs_to :situation
  belongs_to :user
end
