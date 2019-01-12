require 'test_helper'

class TeamThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_theme = team_themes(:one)
  end

  test "should get index" do
    get team_themes_url, as: :json
    assert_response :success
  end

  test "should create team_theme" do
    assert_difference('TeamTheme.count') do
      post team_themes_url, params: { team_theme: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show team_theme" do
    get team_theme_url(@team_theme), as: :json
    assert_response :success
  end

  test "should update team_theme" do
    patch team_theme_url(@team_theme), params: { team_theme: {  } }, as: :json
    assert_response 200
  end

  test "should destroy team_theme" do
    assert_difference('TeamTheme.count', -1) do
      delete team_theme_url(@team_theme), as: :json
    end

    assert_response 204
  end
end
