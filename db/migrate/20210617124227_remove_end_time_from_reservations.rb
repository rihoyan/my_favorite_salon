class RemoveEndTimeFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :end_time, :time
  end
end
