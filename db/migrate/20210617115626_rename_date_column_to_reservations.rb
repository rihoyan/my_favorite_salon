class RenameDateColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :date, :day
  end
end
