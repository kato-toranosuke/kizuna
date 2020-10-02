class AddQrToUpdateModels < ActiveRecord::Migration[6.0]
  def change
    add_column :update_models, :qr, :string
  end
end
