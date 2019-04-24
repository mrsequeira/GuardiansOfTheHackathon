require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:miguel)
  end

  test "should get index" do
    token = login_admin
    get api_v1_participants_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should create participant" do
    token = login_admin
    assert_difference('Participant.count') do
      post api_v1_participants_url, headers: { Authorization: token }, params: { participant: { "name": "Miguel Silva", "vegan": "true", "tshirt_size": "L", "motor_difficulties": "None", "allergies": "None", "leader": "false", "phone": "123456788", "course": "Informatica", "team_id": teams(:one).id, "user_id": users(:two).id } }, as: :json
    end

    assert_response 200
  end

  test "should show participant" do
    token = login_admin
    get api_v1_participant_url(@participant), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update participant" do
    token = login_admin
    patch api_v1_participant_url(@participant), headers: { Authorization: token }, params: { participant: { "name": "Miguel Silva", "vegan": "true", "tshirt_size": "L", "motor_difficulties": "None", "allergies": "None", "leader": "false", "phone": "123456788", "course": "Informatica", "team_id": teams(:one).id, "user_id": users(:two).id } }, as: :json
    assert_response 200
  end

  test "should destroy participant" do
    token = login_admin
    assert_difference('Participant.count', -1) do
      delete api_v1_participant_url(@participant), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
