class Figurine < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews
  has_many :favourites
end
