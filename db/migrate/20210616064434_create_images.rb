class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :salon
      t.string :image_id

      t.timestamps
    end
  end
end
