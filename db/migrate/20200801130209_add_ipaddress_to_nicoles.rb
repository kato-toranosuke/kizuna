class AddIpaddressToNicoles < ActiveRecord::Migration[6.0]
  def change
    add_column :nicoles, :ipaddress, :string
  end
end
