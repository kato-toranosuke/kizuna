class AddQrToRestModels < ActiveRecord::Migration[6.0]
  def change
    add_column :rest_models, :qr, :string
  end
end
