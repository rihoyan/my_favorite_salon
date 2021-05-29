class AddActiveToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :active, :boolean, default: 'true', null: 'false'
  end
end
