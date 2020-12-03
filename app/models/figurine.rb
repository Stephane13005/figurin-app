class Figurine < ApplicationRecord
  # MEDIA_UNIVERSES: [["Transportation", ["bus", "taxi", "train" ]],["Eat/Drink", ["meal", "tea/cafe"]]]

  belongs_to :user
  has_one_attached :photo
  has_many :reviews
  has_many :favourites

  include PgSearch::Model
  pg_search_scope :search_by,
                  against: %i[name year brand media_universe media_year],
                  using: {
                    tsearch: { prefix: true }
                  }
end
