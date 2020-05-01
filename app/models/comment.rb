# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :text, presence: true
end
