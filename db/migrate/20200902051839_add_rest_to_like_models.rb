class AddRestToLikeModels < ActiveRecord::Migration[6.0]
  def change
    add_column :like_models, :rest, :integer
  end
end
