class AddDetialsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :time, :string
    add_column :reservations, :menu_id, :integer
  end
end
