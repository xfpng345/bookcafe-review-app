class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader
  
  def self.search(search)
    return Shop.all unless search
    Shop.where(['name LIKE ?', "%#{search}%"])
    Shop.where(['text LIKE ?', "%#{search}%"])
  end
end
