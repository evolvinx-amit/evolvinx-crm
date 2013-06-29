class User < ActiveRecord::Base
  belongs_to :role

  # Mass Assignment Protection
  attr_accessible :name, :address, :city, :username, :email, :phone, :state, :zip, :mobile, :fax, :password,
    :role_id, :notes

  # Validations for Users
  validates_presence_of :name, :username, :email, :role_id
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
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

end
