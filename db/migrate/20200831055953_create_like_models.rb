class CreateLikeModels < ActiveRecord::Migration[6.0]
  def change
    create_table :like_models do |t|
      t.string :ipaddress
      t.integer :record_id
      t.integer :like
      t.timestamps
    end
  end
end
