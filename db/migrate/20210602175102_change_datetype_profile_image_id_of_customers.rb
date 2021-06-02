class ChangeDatetypeProfileImageIdOfCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :profile_image_id, :string
  end
end
