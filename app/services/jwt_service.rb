class JwtService    
   class << self
        def encode(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
        end 

        def decode(token)
            body = JWT.decode(token, Rails.application.credentials.secret_key_base,
                            true, algorithm:'HS256', typ: 'JWT' )
            #puts body
            HashWithIndifferentAccess.new(body)
        rescue JWT::ExpiredSignature
            nil
        rescue
            nil 
        end
    end
end