class AddProperFkToAuthObjectsTable < ActiveRecord::Migration
  def change
    remove_foreign_key :auth_objects, :applications
    add_foreign_key :auth_objects, :applications, on_delete: :cascade
  end
end
