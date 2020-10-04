class CreateSampleLoginModels < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_login_models do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
