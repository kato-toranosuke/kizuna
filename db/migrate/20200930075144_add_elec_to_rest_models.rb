class AddElecToRestModels < ActiveRecord::Migration[6.0]
  def change
    add_column :rest_models, :elec, :string
  end
end
