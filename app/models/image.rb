class Image < ApplicationRecord
  belongs_to :salon
  has_many :likes
  attachment :image

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
