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

  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and shop_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        shop_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

end
