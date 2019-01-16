require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "logged user should get index" do
    token = login_admin
    get api_v1_events_url, headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "logged user should create event" do
    token = login_admin
    # byebug
    assert_difference('Event.count') do
      post api_v1_events_url, headers: { Authorization: token }, params: { event: { description: @event.description, name: @event.name } }, as: :json
    end

    assert_response 201
  end

  test "logged user should show event" do
    token = login_admin
    get api_v1_event_url(@event), headers: { Authorization: token }, as: :json
    assert_response :success
  end

  test "admin user should update event" do
    token = login_admin
    patch api_v1_event_url(@event), headers: { Authorization: token }, params: { event: { description: @event.description, name: @event.name } }, as: :json
    assert_response 200
  end

  test "admin user should destroy event" do
    token = login_admin
    assert_difference('Event.count', -1) do
      delete api_v1_event_url(@event), headers: { Authorization: token }, as: :json
    end

    assert_response 204
  end
end
