class AddDetialsToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :price, :integer
    add_column :menus, :salon_id, :integer
  end
end
