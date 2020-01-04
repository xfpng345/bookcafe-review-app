class Like < ApplicationRecord
  belongs_to :user
  belongs_to :shop, counter_cache: :likes_count
end
