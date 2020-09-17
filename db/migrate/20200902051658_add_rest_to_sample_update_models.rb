class AddRestToSampleUpdateModels < ActiveRecord::Migration[6.0]
  def change
    add_column :sample_update_models, :rest, :integer
  end
end
