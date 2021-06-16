class Like < ApplicationRecord
  belongs_to :customer
  belongs_to :image
  attachment :image
end
