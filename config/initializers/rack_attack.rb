class Rack::Attack

    Rack::Attack.safelist('allow from localhost') do |req|
        # Requests are allowed if the return value is truthy
        '127.0.0.1' == req.ip || '::1' == req.ip
     end

    throttle('api/v1/login', limit: 5, period: 20.seconds) do |req|
        if req.path == '/api/v1/login' && req.post?
          req.ip
        end
    end

    throttle("api/v1/login", limit: 5, period: 20.seconds) do |req|
        if req.path == '/api/v1/login' && req.post?
          # return the email if present, nil otherwise
            req.params['email'].presence
            req.params['password'].presence
        end
    end

end