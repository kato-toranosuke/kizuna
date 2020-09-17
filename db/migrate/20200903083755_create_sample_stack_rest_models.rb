class CreateSampleStackRestModels < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_stack_rest_models do |t|
      t.string :name
      t.integer :mask
      t.integer :temp
      t.integer :alcohol
      t.integer :takeout
      t.integer :time
      t.string :googlemap
      t.string :tabelog
      t.string :homepage
      t.timestamps
    end
  end
end
