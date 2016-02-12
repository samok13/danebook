class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.string :gender
      t.string :password_digest
      t.string :auth_token

      t.index :first_name 
      t.index :last_name
      t.index :email, unique: true
      t.index :birthday
      t.index :gender
      t.index :auth_token, unique: true

      t.timestamps null: false
    end
  end
end


