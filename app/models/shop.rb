class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader
  
  def self.search(search)
    return Shop.all unless search
    Shop.where(['name LIKE ?', "%#{search}%"])
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
end
