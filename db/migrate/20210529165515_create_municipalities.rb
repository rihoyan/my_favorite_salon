class CreateMunicipalities < ActiveRecord::Migration[5.2]
  def change
    create_table :municipalities do |t|
      t.string :city_name, null: false, limit: 16
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
