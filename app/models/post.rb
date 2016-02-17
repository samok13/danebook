class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable 

  validates :user_id, :body, presence: true
end
