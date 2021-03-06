class Figurine < ApplicationRecord
  belongs_to :user
  has_one_attached :photo, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favorited_by, through: :favourites, source: :user
  monetize :price_cents
  has_many :likes, dependent: :destroy
  has_many :orders, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by,
                  against: %i[name year brand media_universe media_year],
                  using: {
                    tsearch: { prefix: true }
                  }
end
