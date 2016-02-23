class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :avatar, :foreign_key => :avatar_id , :class_name => "Photo"
  belongs_to :cover_photo, :foreign_key => :cover_photo_id , :class_name => "Photo"
end
