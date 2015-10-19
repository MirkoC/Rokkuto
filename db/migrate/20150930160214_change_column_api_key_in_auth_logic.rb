class ChangeColumnApiKeyInAuthLogic < ActiveRecord::Migration
  def change
    remove_column :auth_objects, :api_key
    change_table :auth_objects do |t|
      t.references :application, index: true, foreign_key: true, on_delete: :cascade
    end
  end
end
