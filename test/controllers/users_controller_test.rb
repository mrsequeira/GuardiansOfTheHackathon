require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:xpto)
  end

  test "should get index" do
    token = login_admin
    get  api_v1_users_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should show user" do
    token = login_admin
    get  api_v1_user_url(@user), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update user" do
    token = login_admin
    patch  api_v1_user_url(@user), headers: { Authorization: token }, params: { users: {"email": "henrique@ipt.pt", "password": "adminpwd" , "email_confirmed": "true"  } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    token = login_admin
    assert_difference('User.count', -1) do
      delete  api_v1_user_url(@user), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
