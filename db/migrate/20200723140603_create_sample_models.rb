class CreateSampleModels < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_models do |t|

      t.timestamps
    end
  end
end
