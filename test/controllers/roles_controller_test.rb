require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:three)
  end

   test "should get index" do
    token = login_admin
     get api_v1_roles_url, headers: { Authorization: token }, as: :json
     assert_response :success
   end

   test "should create role" do
    token = login_admin
     assert_difference('Role.count') do
       post api_v1_roles_url, headers: { Authorization: token }, params: { role: { "name": "xpto" } }, as: :json
     end

     assert_response 200
   end

   test "should show role" do
    token = login_admin
     get api_v1_role_url(@role), headers: { Authorization: token }, as: :json
     assert_response :success
   end

   test "should update role" do
    token = login_admin
     patch api_v1_role_url(@role), headers: { Authorization: token }, params: { role: { "name": "xpto" } }, as: :json
     assert_response 200
   end

   test "should destroy role" do
    token = login_admin
     assert_difference('Role.count', -1) do
       delete api_v1_role_url(@role), headers: { Authorization: token }, as: :json
     end
     assert_response :success
   end
end