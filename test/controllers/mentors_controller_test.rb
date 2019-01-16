require 'test_helper'

class MentorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentor = mentors(:one)
  end

  test "should get index" do
    get mentors_url, as: :json
    assert_response :success
  end

  test "should create mentor" do
    assert_difference('Mentor.count') do
      post mentors_url, params: { mentor: { "name_mentor": "José","vegan": true,"tshirt_size": "L","mentor_difficulties": "nenhuma","mentor_allergies": "Asma","user_id": users(:one).id,"theme_id": theme(:teste).id } }, as: :json
    end

    assert_response 201
  end

  test "should show mentor" do
    get mentor_url(@mentor), as: :json
    assert_response :success
  end

  test "should update mentor" do
    patch mentor_url(@mentor), params: { mentor: {  "name_mentor": "José","vegan": true,"tshirt_size": "L","mentor_difficulties": "nenhuma","mentor_allergies": "Asma","user_id": users(:one).id,"theme_id": theme(:teste).id  } }, as: :json
    assert_response 200
  end

  test "should destroy mentor" do
    assert_difference('Mentor.count', -1) do
      delete mentor_url(@mentor), as: :json
    end

    assert_response 204
  end
end
