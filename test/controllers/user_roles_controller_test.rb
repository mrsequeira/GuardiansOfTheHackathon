require 'test_helper'

class UserRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_role = user_roles(:one)
  end

  test "should get index" do
    token = login_admin
    get api_v1_user_roles_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should create user_role" do
    token = login_admin
    assert_difference('UserRole.count') do
      post api_v1_user_roles_url, headers: { Authorization: token }, params: { user_role: { "role_id": roles(:one).id, "user_id": users(:one).id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_roles" do
    token = login_admin
    get api_v1_user_role_url(@user_role), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update user_role" do
    token = login_admin
    patch api_v1_user_role_url(@user_role), headers: { Authorization: token }, params: { user_role: { "role_id": roles(:one).id, "user_id": users(:one).id } }, as: :json
    assert_response 200
  end

  test "should destroy user_role" do
    token = login_admin
    assert_difference('UserRole.count', -1) do
      delete api_v1_user_role_url(@user_role), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
