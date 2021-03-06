class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login
  # attr_accessible :username, :email, :role

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  validate :validate_username

  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  
 

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end

  ROLES = %w[admin manager user unregisterd]

  # def is?(role)
  #   ROLES.include?(role.to_s)
  # end
  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
  
  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.welcome_email(self).deliver_later
  end
  
end
