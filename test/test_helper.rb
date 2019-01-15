ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
   
  set_fixture_class theme: Theme
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_admin
  	post api_v1_login_url, params: { email: "admin@ipt.pt", password: "adminpwd" }, as: :json
  	if response.status == 200
  		JSON.parse(response.body)["auth_token"]
  	else
  		nil
  	end
  end

end
