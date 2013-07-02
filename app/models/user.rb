class User < ActiveRecord::Base
  has_many :lead, :dependent => :delete_all, :foreign_key => 'owner'
  has_many :contact, :dependent => :delete_all, :foreign_key => 'owner'
  has_many :account, :dependent => :delete_all, :foreign_key => 'owner'
  belongs_to :role
  # Mass Assignment Protection
  attr_accessible :name, :address, :city, :username, :email, :phone, :state, :zip, :mobile, :fax, :password ,:remember_me,
    :role_id, :notes
  attr_accessor :password, :remember_me

  before_save :encrypt_password

  # Validations for Users
  validates_presence_of :name, :username, :email, :role_id
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :username, :email
  validates_length_of :password, :minimum  => 6
  before_create :new_user

  # Used to set New Users defaults
  def new_user
    if self.role_id.nil?
      self.role_id = 3
    end
  end

  def self.search_users(search_users, sort_column, sort_direction)
    User.where('name LIKE  ?', "%#{search_users}%").order(sort_column+ " "+sort_direction)
  end


  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def self.authenticate_by_username(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
