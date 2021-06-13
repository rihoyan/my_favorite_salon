class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :customer,null: false
      t.references :salon,   null: false
      t.date :date,             null: false
      t.time :start_time,       null: false
      t.time :end_time
      t.string :ref_image_id
      t.text :ref_comment
      t.string :telephone_number,null: false
      t.integer :status,         defalut: 0

      t.timestamps
    end
  end
end
