# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  has_many :shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_shops, through: :likes, source: :shop

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy# rubocop:disable all
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy# rubocop:disable all
  has_many :followers, through: :follower_relationships

  has_many :active_notifications, foreign_key: 'visitor_id', class_name: 'Notification', dependent: :destroy# rubocop:disable all
  has_many :passive_notifications, foreign_key: 'visited_id', class_name: 'Notification', dependent: :destroy# rubocop:disable all

  mount_uploader :image, ImageUploader

  validates :username, presence: true, length: { maximum: 10 }
  validates :email, presence: true

  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    return if temp.present?

    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end
end
