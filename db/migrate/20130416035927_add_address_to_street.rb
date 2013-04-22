class AddAddressToStreet < ActiveRecord::Migration
  def change
    add_column :streets, :address, :string
  end
end
