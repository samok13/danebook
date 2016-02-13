class User < ActiveRecord::Base
  has_one :profile, inverse_of: :user, dependent: :destroy
  has_many :posts

  before_create :generate_token
  after_create :create_profile
  #before_action :require_login, :except => [:new, :create]
  has_secure_password

  validates :password, 
            :length => { :in => 8..24 }, 
            :allow_nil => true

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end


end
