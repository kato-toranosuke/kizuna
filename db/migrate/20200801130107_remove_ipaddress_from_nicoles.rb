class RemoveIpaddressFromNicoles < ActiveRecord::Migration[6.0]
  def change
    remove_column :nicoles, :status, :string
  end
end
