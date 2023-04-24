require "application_system_test_case"

class SamsungcallsTest < ApplicationSystemTestCase
  setup do
    @samsungcall = samsungcalls(:one)
  end

  test "visiting the index" do
    visit samsungcalls_url
    assert_selector "h1", text: "Samsungcalls"
  end

  test "creating a Samsungcall" do
    visit samsungcalls_url
    click_on "New Samsungcall"

    fill_in "Address", with: @samsungcall.address
    fill_in "Email", with: @samsungcall.email
    fill_in "Flag", with: @samsungcall.flag
    fill_in "Fourk", with: @samsungcall.fourk
    check "Hass" if @samsungcall.hass
    fill_in "Name", with: @samsungcall.name
    fill_in "Note", with: @samsungcall.note
    fill_in "Phone1", with: @samsungcall.phone1
    fill_in "Phone2", with: @samsungcall.phone2
    fill_in "Status", with: @samsungcall.status
    fill_in "Zipcode", with: @samsungcall.zipcode
    click_on "Create Samsungcall"

    assert_text "Samsungcall was successfully created"
    click_on "Back"
  end

  test "updating a Samsungcall" do
    visit samsungcalls_url
    click_on "Edit", match: :first

    fill_in "Address", with: @samsungcall.address
    fill_in "Email", with: @samsungcall.email
    fill_in "Flag", with: @samsungcall.flag
    fill_in "Fourk", with: @samsungcall.fourk
    check "Hass" if @samsungcall.hass
    fill_in "Name", with: @samsungcall.name
    fill_in "Note", with: @samsungcall.note
    fill_in "Phone1", with: @samsungcall.phone1
    fill_in "Phone2", with: @samsungcall.phone2
    fill_in "Status", with: @samsungcall.status
    fill_in "Zipcode", with: @samsungcall.zipcode
    click_on "Update Samsungcall"

    assert_text "Samsungcall was successfully updated"
    click_on "Back"
  end

  test "destroying a Samsungcall" do
    visit samsungcalls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Samsungcall was successfully destroyed"
  end
end
