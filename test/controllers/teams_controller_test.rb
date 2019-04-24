require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    token = login_admin
    get api_v1_teams_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should create team" do
    token = login_admin
    assert_difference('Team.count') do
      post api_v1_teams_url, headers: { Authorization: token }, params: { team: { "name": "teste", "project": "teste", "description": "Teste descricao", "photo": "teste.jpg" } }, as: :json
    end

    assert_response 201
  end

  test "should show team" do
    token = login_admin
    get api_v1_team_url(@team), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update team" do
    token = login_admin
    patch api_v1_team_url(@team), headers: { Authorization: token }, params: { team: { "name": "teste", "project": "teste", "description": "Teste descricao", "photo": "teste.jpg" } }, as: :json
    assert_response 200
  end

  test "should destroy team" do
    token = login_admin
    assert_difference('Team.count', -1) do
      delete api_v1_team_url(@team), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
