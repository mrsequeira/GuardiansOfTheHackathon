require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
  end

  # test "should get index" do
  #   get api_v1_roles_url, as: :json
  #   assert_response :success
  # end

  # test "should create role" do
  #   assert_difference('Role.count') do
  #     post api_v1_roles_url, params: { role: {  } }, as: :json
  #   end

  #   assert_response 201
  # end

  # test "should show role" do
  #   get api_v1_role_url(@role), as: :json
  #   assert_response :success
  # end

  # test "should update role" do
  #   patch api_v1_role_url(@role), params: { role: {  } }, as: :json
  #   assert_response 200
  # end

  # test "should destroy role" do
  #   assert_difference('Role.count', -1) do
  #     delete api_v1_role_url(@role), as: :json
  #   end
  #   assert_response :success
  # end
end
