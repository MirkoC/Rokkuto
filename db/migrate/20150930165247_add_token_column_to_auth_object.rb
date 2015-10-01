class AddTokenColumnToAuthObject < ActiveRecord::Migration
  def change
    add_column :auth_objects, :token, :string
  end
end
