require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get frontdoor" do
    get pages_frontdoor_url
    assert_response :success
  end

  test "should get webPortal" do
    get pages_webPortal_url
    assert_response :success
  end

  test "should get phonePortal" do
    get pages_phonePortal_url
    assert_response :success
  end

  test "should get selfHelp" do
    get pages_selfHelp_url
    assert_response :success
  end

  test "should get helpLink" do
    get pages_helpLink_url
    assert_response :success
  end

  test "should get aux" do
    get pages_aux_url
    assert_response :success
  end

end
