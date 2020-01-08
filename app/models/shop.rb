class Shop < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
