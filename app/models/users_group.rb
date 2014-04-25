class UsersGroup < ActiveRecord::Base
	belongs_to :user
  belongs_to :group

    validates :user, uniqueness: { scope: :group,
    message: "already member" }
end
