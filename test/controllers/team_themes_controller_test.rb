require 'test_helper'

class TeamThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_theme = team_themes(:one)
  end

  test "should get index" do
    token = login_admin
    get api_v1_team_themes_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should create team_theme" do
    token = login_admin
    assert_difference('TeamTheme.count') do
      post api_v1_team_themes_url, headers: { Authorization: token }, params: { team_theme: {team_id: teams(:one).id,theme_id: themes(:teste).id} }, as: :json
    end

    assert_response 201
  end

  test "should show team_theme" do
    token = login_admin
    get api_v1_team_theme_url(@team_theme), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update team_theme" do
    token = login_admin
    patch api_v1_team_theme_url(@team_theme), headers: { Authorization: token }, params: { team_theme: { team_id: teams(:one).id,theme_id: themes(:teste).id}  }, as: :json
    assert_response 200
  end

  test "should destroy team_theme" do
    token = login_admin
    assert_difference('TeamTheme.count', -1) do
      delete api_v1_team_theme_url(@team_theme), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
