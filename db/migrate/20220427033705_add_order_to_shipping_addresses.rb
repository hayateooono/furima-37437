class AddOrderToShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :shipping_addresses, :order, :integer
  end
end
