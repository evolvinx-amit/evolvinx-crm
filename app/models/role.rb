class Role < ActiveRecord::Base
	has_many :users, :dependent => :delete_all, :foreign_key => 'role_id'
  validates_uniqueness_of :name
end
