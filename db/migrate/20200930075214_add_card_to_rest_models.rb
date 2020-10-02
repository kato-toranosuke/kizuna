class AddCardToRestModels < ActiveRecord::Migration[6.0]
  def change
    add_column :rest_models, :card, :string
  end
end
