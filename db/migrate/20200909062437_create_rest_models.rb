class CreateRestModels < ActiveRecord::Migration[6.0]
  def change
    create_table :rest_models do |t|
      t.string :name
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
      t.string :googlemap
      t.string :tabelog
      t.string :homepage
      t.timestamps
    end
  end
end
