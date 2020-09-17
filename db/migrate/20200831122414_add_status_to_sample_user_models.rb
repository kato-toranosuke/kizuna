class AddStatusToSampleUserModels < ActiveRecord::Migration[6.0]
  def change
    add_column :sample_user_models, :status, :integer
  end
end
