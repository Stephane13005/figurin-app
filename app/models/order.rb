class Order < ApplicationRecord
  belongs_to :user
  belongs_to :figurine
  monetize :amount_cents
end
