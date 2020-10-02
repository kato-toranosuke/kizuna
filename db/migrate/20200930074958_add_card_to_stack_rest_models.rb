class AddCardToStackRestModels < ActiveRecord::Migration[6.0]
  def change
    add_column :stack_rest_models, :card, :string
  end
end
