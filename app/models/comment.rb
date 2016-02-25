class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy 
  belongs_to :commentable, :polymorphic => true

  validates :body, presence: true

end
