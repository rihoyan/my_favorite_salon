class RenameImageIdColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_id, :style_image_id
  end
end
