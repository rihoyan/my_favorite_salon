class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salon
  attachment :ref_image
  belongs_to :menu
  enum status: { 予約中: 0, 完了: 1, キャンセル: 2 }
  validates :telephone_number, presence: true
  validates :telephone_number, numericality: true
  validates :menu_id, presence: true
  validates :start_time, uniqueness: { message: 'は他のユーザーが予約しています' }

  def date_before_start
    errors.add(:day, "は過去の日付を選択できません") if day < Date.today
  end

end