class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :name, null: false, limit: 4

      t.timestamps
    end
  end
end
