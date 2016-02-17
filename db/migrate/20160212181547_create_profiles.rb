class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, foreign_key: :user_id, null:false
      t.string :number
      t.date :birthday
      t.string :college
      t.string :hometown
      t.string :lives
      t.string :about
      t.string :words

       t.index :user_id, unique: true


      t.timestamps null: false
    end
  end
end
