require 'test_helper'

class WebCallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @web_call = web_calls(:one)
  end

  test "should get index" do
    get web_calls_url
    assert_response :success
  end

  test "should get new" do
    get new_web_call_url
    assert_response :success
  end

  test "should create web_call" do
    assert_difference('WebCall.count') do
      post web_calls_url, params: { web_call: { Appliance: @web_call.Appliance, asap: @web_call.asap, closed: @web_call.closed, name: @web_call.name, timeend: @web_call.timeend, timestart: @web_call.timestart, zipcode: @web_call.zipcode } }
    end

    assert_redirected_to web_call_url(WebCall.last)
  end

  test "should show web_call" do
    get web_call_url(@web_call)
    assert_response :success
  end

  test "should get edit" do
    get edit_web_call_url(@web_call)
    assert_response :success
  end

  test "should update web_call" do
    patch web_call_url(@web_call), params: { web_call: { Appliance: @web_call.Appliance, asap: @web_call.asap, closed: @web_call.closed, name: @web_call.name, timeend: @web_call.timeend, timestart: @web_call.timestart, zipcode: @web_call.zipcode } }
    assert_redirected_to web_call_url(@web_call)
  end

  test "should destroy web_call" do
    assert_difference('WebCall.count', -1) do
      delete web_call_url(@web_call)
    end

    assert_redirected_to web_calls_url
  end
end
