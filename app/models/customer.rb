class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable
  attachment :profile_image
  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_images, through: :likes, source: :image
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :telephone_number, presence: true
  validates :telephone_number, uniqueness: true
  validates :telephone_number, numericality: true
end
