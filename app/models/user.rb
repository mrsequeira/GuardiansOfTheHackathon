class User < ApplicationRecord

    has_secure_password
    has_many :user_roles
    has_many :roles, :through => :user_roles

    validates :email, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},  presence: true, :uniqueness => true
    validates :password, length: { minimum: 2,maximum: 20 }, presence: true

end
