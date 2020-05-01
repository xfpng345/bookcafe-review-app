# frozen_string_literal: true

class Shop < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  validates :name, presence: true
  validates :text, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  enum wifi: { yes: 1, no: 2 }
  enum power: { able: 1, unable: 2 }
end
