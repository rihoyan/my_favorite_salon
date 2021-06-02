class Menu < ApplicationRecord
  has_many :menu_salon
  has_many :salons, through: :menu_salon
end
