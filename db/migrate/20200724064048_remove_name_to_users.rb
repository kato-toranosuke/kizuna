class RemoveNameToUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :nanaos
  end
end
