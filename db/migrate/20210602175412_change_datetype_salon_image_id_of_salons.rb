class ChangeDatetypeSalonImageIdOfSalons < ActiveRecord::Migration[5.2]
  def change
    change_column :salons, :salon_image_id, :string
  end
end
