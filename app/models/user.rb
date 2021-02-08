class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable
  validates :name, presence: true, length: { maximum:30 }
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :situations
  has_many :tsukkomis
  mount_uploader :image, ImageUploader
end
