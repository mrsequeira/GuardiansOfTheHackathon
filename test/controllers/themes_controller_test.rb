require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @theme = themes(:one)
  end

  test "should get index" do
    token = login_admin
    get api_v1_themes_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should create theme" do
    token = login_admin
    assert_difference('Theme.count') do
      post api_v1_themes_url, headers: { Authorization: token }, params: { theme: { "name_theme": "teste", "description_theme": "teste" } }, as: :json
    end

    assert_response 201
  end

  test "should show theme" do
    token = login_admin
    get api_v1_theme_url(@theme), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "should update theme" do
    token = login_admin
    patch api_v1_theme_url(@theme), headers: { Authorization: token }, params: { theme: { "name_theme": "teste", "description_theme": "teste" } }, as: :json
    assert_response 200
  end

  test "should destroy theme" do
    token = login_admin
    assert_difference('Theme.count', -1) do
      delete api_v1_theme_url(@theme), headers: { Authorization: token }, as: :json
    end

    assert_response 200
  end
end
