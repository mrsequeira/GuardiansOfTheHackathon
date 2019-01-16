class Role < ApplicationRecord

    has_many :user_roles
    has_many :users, :through => :user_roles

    validates :name, presence:true, length: {minimum:4, maximum:25}
end
