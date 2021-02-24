require "application_system_test_case"

class WebCallsTest < ApplicationSystemTestCase
  setup do
    @web_call = web_calls(:one)
  end

  test "visiting the index" do
    visit web_calls_url
    assert_selector "h1", text: "Web Calls"
  end

  test "creating a Web call" do
    visit web_calls_url
    click_on "New Web Call"

    fill_in "Appliance", with: @web_call.Appliance
    check "Asap" if @web_call.asap
    check "Closed" if @web_call.closed
    fill_in "Name", with: @web_call.name
    fill_in "Timeend", with: @web_call.timeend
    fill_in "Timestart", with: @web_call.timestart
    fill_in "Zipcode", with: @web_call.zipcode
    click_on "Create Web call"

    assert_text "Web call was successfully created"
    click_on "Back"
  end

  test "updating a Web call" do
    visit web_calls_url
    click_on "Edit", match: :first

    fill_in "Appliance", with: @web_call.Appliance
    check "Asap" if @web_call.asap
    check "Closed" if @web_call.closed
    fill_in "Name", with: @web_call.name
    fill_in "Timeend", with: @web_call.timeend
    fill_in "Timestart", with: @web_call.timestart
    fill_in "Zipcode", with: @web_call.zipcode
    click_on "Update Web call"

    assert_text "Web call was successfully updated"
    click_on "Back"
  end

  test "destroying a Web call" do
    visit web_calls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Web call was successfully destroyed"
  end
end
