class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable
  validates :name, presence: true, length: { maximum:30 }
  validates :profile, length: { maximum: 150 }
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :situations, dependent: :destroy
  has_many :tsukkomis, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
