class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile

  validates :first_name, :last_name, :gender, :user, presence: true

end
