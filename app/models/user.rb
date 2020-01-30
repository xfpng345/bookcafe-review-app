class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_shops, through: :likes, source: :shop

  mount_uploader :image, ImageUploader

  validates :username, presence: true, length: { maximum: 10 }
  validates :email, presence: true
end
