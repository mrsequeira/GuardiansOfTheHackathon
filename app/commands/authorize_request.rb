class AuthorizeRequest
    prepend SimpleCommand
  
    def initialize(headers = {})
      @headers = headers
    end
  
    def call
      user
    end
  
    private
 
    attr_reader :headers  
  
    def user
      @user ||= User.find(decoded_auth_token["user_id"][0]["user_id"]) if decoded_auth_token 
      @user || errors.add(:token, 'Invalid token') && nil
    end
    
    def decoded_auth_token
      @decoded_auth_token ||= JwtService.decode(http_auth_header.split(' ').last)
    end
  
    def http_auth_header
      #puts "Headers: #{headers['Authorization']}" 
      if headers['Authorization'].present?
        #puts "Splip feito #{headers['Authorization'].split(' ').last} "
        return headers['Authorization'].split(' ').last
      else
        errors.add(:token, 'Missing token')
      end
      nil
    end
end


