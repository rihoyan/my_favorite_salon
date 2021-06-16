class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable
  attachment :profile_image
  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_images, through: :likes, source: :image

end
