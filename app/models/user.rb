class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :photos
  has_many :likes

  has_many :initiated_friendings, :foreign_key => :friender_id, :class_name => 'Friending'
  has_many :friended_users, :through => :initiated_friendings, :source => :friend_recipient

  has_many :received_friendings, :foreign_key => :friend_id, :class_name => 'Friending'
  has_many :users_friended_by, :through => :received_friendings, :source => :friend_initiator

  before_create :generate_token
  after_create :create_profile
  has_secure_password

  validates :password, 
            :length => { :in => 8..24 }, 
            :allow_nil => true
  validates :first_name, :last_name, :email, presence: true

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

  def friends
    (friended_users + users_friended_by).uniq
  end

  def name
    "#{@first_name} #{@last_name}"
  end

private
  
  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end

end
