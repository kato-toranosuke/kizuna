class CreateSampleUserModels < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_user_models do |t|
      t.string :item
      t.string :comment
      t.string :ipaddress
      t.timestamps
    end
  end
end
