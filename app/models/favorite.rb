class Favorite < ApplicationRecord
  belongs_to :salon, foreign_key: true, null: false
  belongs_to :customer, foreign_key: true, null: false
end
