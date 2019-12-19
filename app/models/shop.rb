class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Shop.all unless search
    Shop.where(['name LIKE ?', "%#{search}%"])
  end
end
