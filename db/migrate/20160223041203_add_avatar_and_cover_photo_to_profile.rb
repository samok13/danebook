class AddAvatarAndCoverPhotoToProfile < ActiveRecord::Migration
  def change  
    add_column :profiles, :avatar_id, :integer
    add_index :profiles, :avatar_id
    add_column :profiles, :cover_photo_id, :integer
    add_index :profiles, :cover_photo_id
  end
end
