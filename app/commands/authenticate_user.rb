class AuthenticateUser
  prepend SimpleCommand

  attr_reader :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    @result = nil
    if passowrd_valid?
      @result = JwtService.encode(contents) 
    else
      errors.add(:authenticate, 'error authtenticating user')
    end
  end

  def user
    @user ||= User.find_by(email: email)
  end

  def passowrd_valid?
    user && user.authenticate(password)
  end
  
  def contents
    {
      user_id: user.id
    }
  end

end