class Tsukkomi < ApplicationRecord
  validates :phrase, presence: true
  belongs_to :situation
end
