class CreateMenuSalons < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_salons do |t|
      t.references :salon, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
