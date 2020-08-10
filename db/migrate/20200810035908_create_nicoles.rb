class CreateNicoles < ActiveRecord::Migration[6.0]
  def change
    create_table :nicoles do |t|
      t.string :name
      t.string :comment
      t.string :ipaddress
      t.timestamps
    end
  end
end
