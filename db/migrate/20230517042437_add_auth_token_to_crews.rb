class AddAuthTokenToCrews < ActiveRecord::Migration[6.0]
  def change
  	add_column :crews, :auth_token, :string, index: true
  end
end
