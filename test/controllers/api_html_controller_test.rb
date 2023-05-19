require 'test_helper'

class ApiHtmleControllerTest < ActionDispatch::IntegrationTest
  test "should get portal" do
    get api_htmle_portal_url
    assert_response :success
  end

  test "should get dashboard" do
    get api_htmle_dashboard_url
    assert_response :success
  end

  test "should get techschedule" do
    get api_htmle_techschedule_url
    assert_response :success
  end

  test "should get makecall" do
    get api_htmle_makecall_url
    assert_response :success
  end

end
