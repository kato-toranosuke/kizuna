class AddCardToUpdateModels < ActiveRecord::Migration[6.0]
  def change
    add_column :update_models, :card, :string
  end
end
