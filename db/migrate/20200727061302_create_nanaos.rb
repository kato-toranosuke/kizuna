class CreateNanaos < ActiveRecord::Migration[6.0]
  def change
    create_table :nanaos do |t|
      t.string :name
      t.string :address
      t.boolean :alcohol
      t.boolean :mask
      t.boolean :time
      t.boolean :takeout
      t.boolean :touchless
      t.boolean :card
      t.boolean :linepay
      t.boolean :paypay
      t.boolean :payid
      t.boolean :quicpay
      t.boolean :seat
      t.boolean :contact
      t.boolean :toilet
      t.boolean :airing
      t.boolean :outdoor
      t.boolean :temp
      t.string :atom
      t.boolean :plate
      t.float :rate
      t.timestamps
    end
  end
end
