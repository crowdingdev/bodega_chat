class Group < ActiveRecord::Base
	has_many :users, :through => :users_group
	has_many :users_group
	has_many :messages
	accepts_nested_attributes_for :users, allow_destroy: true
end
