class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :salon, foreign_key: true
      t.string :name
      t.integer :time
      t.integer :price

      t.timestamps
    end
  end
end
