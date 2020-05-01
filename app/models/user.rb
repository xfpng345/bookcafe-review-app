# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_shops, through: :likes, source: :shop

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy, inverse_of: :user
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy, inverse_of: :user
  has_many :followers, through: :follower_relationships

  has_many :active_notifications, foreign_key: 'visitor_id', class_name: 'Notification', dependent: :destroy
  has_many :passive_notifications, foreign_key: 'visited_id', class_name: 'Notification', dependent: :destroy

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
end
