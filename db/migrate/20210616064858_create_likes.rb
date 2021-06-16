class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :customer
      t.references :image

      t.timestamps
    end
  end
end
