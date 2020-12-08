class Like < ApplicationRecord
  belongs_to :figurine, :counter_cache => true 
  belongs_to :user
end
