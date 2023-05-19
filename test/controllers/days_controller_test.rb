require 'test_helper'

class DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:one)
  end

  test "should get index" do
    get days_url
    assert_response :success
  end

  test "should get new" do
    get new_day_url
    assert_response :success
  end

  test "should create day" do
    assert_difference('Day.count') do
      post days_url, params: { day: { date: @day.date, slot1: @day.slot1, slot2: @day.slot2, slot3: @day.slot3, slot4: @day.slot4, slot5: @day.slot5, slot6: @day.slot6, slot7: @day.slot7, slot8: @day.slot8, status: @day.status, tech_id: @day.tech_id } }
    end

    assert_redirected_to day_url(Day.last)
  end

  test "should show day" do
    get day_url(@day)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_url(@day)
    assert_response :success
  end

  test "should update day" do
    patch day_url(@day), params: { day: { date: @day.date, slot1: @day.slot1, slot2: @day.slot2, slot3: @day.slot3, slot4: @day.slot4, slot5: @day.slot5, slot6: @day.slot6, slot7: @day.slot7, slot8: @day.slot8, status: @day.status, tech_id: @day.tech_id } }
    assert_redirected_to day_url(@day)
  end

  test "should destroy day" do
    assert_difference('Day.count', -1) do
      delete day_url(@day)
    end

    assert_redirected_to days_url
  end
end
