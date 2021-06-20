class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salon
  attachment :ref_image
  belongs_to :menu
  enum status: { 予約中: 0, 完了: 1, キャンセル: 2 }
  validates :telephone_number, presence: true
  validates :telephone_number, numericality: true
end