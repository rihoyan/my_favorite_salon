class ChangeDetialsToReservations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reservations, :time, false
    change_column_null :reservations, :menu_id, false
  end
end
