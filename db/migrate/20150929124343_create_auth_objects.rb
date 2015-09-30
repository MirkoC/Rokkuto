class CreateAuthObjects < ActiveRecord::Migration
  def change
    create_table :auth_objects do |t|
      t.string :api_key
      t.string :user_token
      t.string :permissions
      t.integer :content_id
      t.string :content_type

      t.timestamps null: false
    end
  end
end
