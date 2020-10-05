class AddColumnToKizunaUserModels < ActiveRecord::Migration[6.0]
  def change
    add_column  :kizuna_user_models,  :confirmation_token,  :string
    add_column  :kizuna_user_models,  :confirmed_at,        :datetime
    add_column  :kizuna_user_models,  :confirmation_sent_at,:datetime    
    add_column  :kizuna_user_models,  :unconfirmed_email,   :string  
  end
end
