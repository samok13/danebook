class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :user_id, uniqueness: true, presence: true

end
