class RemoveSalonIdFromMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :menus, :salon_id, :integer
  end
end
