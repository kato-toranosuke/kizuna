class CreateSampleUpdateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_update_models do |t|
      t.integer :record_id
      t.integer :mask
      t.integer :open
      t.integer :takeout  
      t.timestamps
    end
  end
end
