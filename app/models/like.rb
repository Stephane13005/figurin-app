class Like < ApplicationRecord
  belongs_to :figurine, counter_cache: :likes_count
  belongs_to :user
  validates :user, uniqueness: true

  scope :popular, -> { select('figurine_id, count(figurine_id) as count').group(:figurine_id).order('count desc').limit(1) }
end
