class Menu < ApplicationRecord
  belongs_to :salon
  has_many :reservations
  has_many :order_details
  validates :name, presence: true
  validates :price, presence: true
  validates :price, presence: true
  validates :price, numericality: true
end
