class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :reservation, null: false
      t.references :menu, null: false
      t.string :styling_image_id
      t.text :comment
      t.integer :stylist_name
      t.integer :favorite_rank

      t.timestamps
    end
  end
end
