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
  validates :prefecture_id, presence: true
  validates :municipality_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :telephone_number, uniqueness: true
  validates :telephone_number, numericality: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :seats, presence: true
  validates :staff_name, presence: true
  validates :stylists, presence: true
  validates :introduction, presence: true

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
