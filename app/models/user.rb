class User < ApplicationRecord

    has_secure_password
    has_many :user_roles
    has_many :roles, :through => :user_roles

    validates :email, format: {with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},  presence: true, :uniqueness => true
    validates :password, length: { minimum: 5,maximum: 69 }, presence: true

    #private
    # call this method once we have successfully verified the confirmation token.
    def validate_email
        self.email_confirmed = true
        self.confirm_token = nil
        #We are not requiring the user to input their password, because most of the logic is happening behind the scenes
        save!(:validate => false)
    end

    def set_confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
end


