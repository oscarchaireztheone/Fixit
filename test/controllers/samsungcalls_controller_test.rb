require 'test_helper'

class SamsungcallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @samsungcall = samsungcalls(:one)
  end

  test "should get index" do
    get samsungcalls_url
    assert_response :success
  end

  test "should get new" do
    get new_samsungcall_url
    assert_response :success
  end

  test "should create samsungcall" do
    assert_difference('Samsungcall.count') do
      post samsungcalls_url, params: { samsungcall: { address: @samsungcall.address, email: @samsungcall.email, flag: @samsungcall.flag, fourk: @samsungcall.fourk, hass: @samsungcall.hass, name: @samsungcall.name, note: @samsungcall.note, phone1: @samsungcall.phone1, phone2: @samsungcall.phone2, status: @samsungcall.status, zipcode: @samsungcall.zipcode } }
    end

    assert_redirected_to samsungcall_url(Samsungcall.last)
  end

  test "should show samsungcall" do
    get samsungcall_url(@samsungcall)
    assert_response :success
  end

  test "should get edit" do
    get edit_samsungcall_url(@samsungcall)
    assert_response :success
  end

  test "should update samsungcall" do
    patch samsungcall_url(@samsungcall), params: { samsungcall: { address: @samsungcall.address, email: @samsungcall.email, flag: @samsungcall.flag, fourk: @samsungcall.fourk, hass: @samsungcall.hass, name: @samsungcall.name, note: @samsungcall.note, phone1: @samsungcall.phone1, phone2: @samsungcall.phone2, status: @samsungcall.status, zipcode: @samsungcall.zipcode } }
    assert_redirected_to samsungcall_url(@samsungcall)
  end

  test "should destroy samsungcall" do
    assert_difference('Samsungcall.count', -1) do
      delete samsungcall_url(@samsungcall)
    end

    assert_redirected_to samsungcalls_url
  end
end
