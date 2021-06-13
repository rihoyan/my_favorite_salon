class AddDetialsToMenuSalons < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_salons, :time, :integer
    add_column :menu_salons, :price, :integer
  end
end
