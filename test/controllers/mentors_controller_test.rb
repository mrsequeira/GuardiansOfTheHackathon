require 'test_helper'

class MentorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentor = mentors(:one)
  end

  test "should get index" do
    token = login_admin
    get api_v1_mentors_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should create mentor" do
    token = login_admin
    assert_difference('Mentor.count') do
      post api_v1_mentors_url, headers: { Authorization: token }, params: { mentor: { "name_mentor": "José","vegan": "true","tshirt_size": "L","mentor_difficulties": "nenhuma","mentor_allergies": "Asma","user_id": users(:one).id,"theme_id": themes(:teste).id } }, as: :json
    end

    assert_response 201
  end

  test "should show mentor" do
    token = login_admin
    get api_v1_mentor_url(@mentor), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update mentor" do
    token = login_admin
    patch api_v1_mentor_url(@mentor), headers: { Authorization: token }, params: { mentor: {  "name_mentor": "José","vegan": "true","tshirt_size": "L","mentor_difficulties": "nenhuma","mentor_allergies": "Asma","user_id": users(:one).id,"theme_id": themes(:teste).id  } }, as: :json
    assert_response 200
  end

  test "should destroy mentor" do
    token = login_admin
    assert_difference('Mentor.count', -1) do
      delete api_v1_mentor_url(@mentor), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
