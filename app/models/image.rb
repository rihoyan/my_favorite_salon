class Image < ApplicationRecord
  belongs_to :salon
  has_many :likes
  attachment :style_image

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

end
