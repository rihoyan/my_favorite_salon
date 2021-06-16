class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :salon
  attachment :ref_image
  enum status: { 予約中: 0, 完了: 1, キャンセル: 2 }

  def self.reservations_after_three_month
      reservations = Reservation.where(salon_id: session[:salon_id]).where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(day: :desc)
      reservation_data = []
      reservations.each do |reservation|
        reservations_hash = {}
        reservations_hash.merge!(date: reservation.date.strftime("%Y-%m-%d"), time: reservation.time)
        reservation_data.push(reservations_hash)
      end
        reservation_data
  end
end