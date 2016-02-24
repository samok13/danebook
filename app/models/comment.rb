class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy 

  validates :body, presence: true

end
