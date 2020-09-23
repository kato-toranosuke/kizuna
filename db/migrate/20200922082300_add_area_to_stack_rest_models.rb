class AddAreaToStackRestModels < ActiveRecord::Migration[6.0]
  def change
    add_column :stack_rest_models, :area, :string
  end
end
