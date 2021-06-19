class ChangeDatatypeStylistNameOfOrderDetails < ActiveRecord::Migration[5.2]
  def change
    change_column :order_details, :stylist_name, :string
  end
end
