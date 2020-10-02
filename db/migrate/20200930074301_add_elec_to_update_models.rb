class AddElecToUpdateModels < ActiveRecord::Migration[6.0]
  def change
    add_column :update_models, :elec, :string
  end
end
