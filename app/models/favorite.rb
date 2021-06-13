class Favorite < ApplicationRecord
  belongs_to :salon
  belongs_to :customer
  validates :customer_id, uniqueness: { scope: :salon_id }
end
