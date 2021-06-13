class ChangeColumnNullToFavorites < ActiveRecord::Migration[5.2]
  def change
    change_column_null :favorites, :salon_id, false
    change_column_null :favorites, :customer_id, false
  end
end
