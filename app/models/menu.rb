class Menu < ApplicationRecord
  belongs_to :salon
  has_many :reservations
  has_many :order_details
end
