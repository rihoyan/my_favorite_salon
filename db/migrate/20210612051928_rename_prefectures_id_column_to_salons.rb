class RenamePrefecturesIdColumnToSalons < ActiveRecord::Migration[5.2]
  def change
    rename_column :salons, :prefectures_id, :prefecture_id
  end
end
