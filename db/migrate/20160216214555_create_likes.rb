class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :likeable_id
      t.string :likeable_type

      t.index :user_id
      t.index :likeable_id
      t.index :likeable_type
      t.index [:user_id, :likeable_type, :likeable_type], unique: true

      t.timestamps null: false
    end
  end
end
