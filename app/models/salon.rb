class Salon < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :images,dependent: :destroy
  has_many :reservations, dependent: :destroy
  belongs_to :prefecture
  belongs_to :municipality
  attachment :salon_image

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
