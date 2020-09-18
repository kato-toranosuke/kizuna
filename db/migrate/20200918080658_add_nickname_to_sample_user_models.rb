class AddNicknameToSampleUserModels < ActiveRecord::Migration[6.0]
  def change
    add_column :sample_user_models, :nickname, :string
  end
end
