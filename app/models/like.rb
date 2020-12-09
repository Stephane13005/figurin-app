class Like < ApplicationRecord
  belongs_to :figurine
  belongs_to :user
  
  scope :popular, -> { select('figurine_id, count(figurine_id) as count').group(:figurine_id).order('count desc').limit(1) }
end
