class ChangeDatialsToMenus < ActiveRecord::Migration[5.2]
  def change
    change_column_null :menus, :price, false
    change_column_null :menus, :salon_id, false
  end
end
