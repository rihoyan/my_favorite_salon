class RenamePhoneNumberColumnToSalons < ActiveRecord::Migration[5.2]
  def change
    rename_column :salons, :phone_number, :telephone_number
  end
end
