class CreateUpdateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :update_models do |t|
        t.integer :record_id
        t.integer :rest
        t.string :mask
        t.string :temp
        t.string :alcohol
        t.string :takeout
        t.string :monday
        t.string :tuesday
        t.string :wednesday
        t.string :thursday
        t.string :friday
        t.string :saturday
        t.string :sunday
        t.timestamps
    end
  end
end
