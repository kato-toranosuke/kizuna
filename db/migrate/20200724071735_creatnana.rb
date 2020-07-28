class Creatnana < ActiveRecord::Migration[6.0]
  def change
    create_table :nanaos do |t|
      t.string :name
      t.string :alcohol
      t.string :mask
      t.timestamps
 end
  end
end
