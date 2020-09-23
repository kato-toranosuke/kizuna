class AddAreaToRestModels < ActiveRecord::Migration[6.0]
  def change
    add_column :rest_models, :area, :string
  end
end
