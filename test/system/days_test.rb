require "application_system_test_case"

class DaysTest < ApplicationSystemTestCase
  setup do
    @day = days(:one)
  end

  test "visiting the index" do
    visit days_url
    assert_selector "h1", text: "Days"
  end

  test "creating a Day" do
    visit days_url
    click_on "New Day"

    fill_in "Date", with: @day.date
    fill_in "Slot1", with: @day.slot1
    fill_in "Slot2", with: @day.slot2
    fill_in "Slot3", with: @day.slot3
    fill_in "Slot4", with: @day.slot4
    fill_in "Slot5", with: @day.slot5
    fill_in "Slot6", with: @day.slot6
    fill_in "Slot7", with: @day.slot7
    fill_in "Slot8", with: @day.slot8
    fill_in "Status", with: @day.status
    fill_in "Tech", with: @day.tech_id
    click_on "Create Day"

    assert_text "Day was successfully created"
    click_on "Back"
  end

  test "updating a Day" do
    visit days_url
    click_on "Edit", match: :first

    fill_in "Date", with: @day.date
    fill_in "Slot1", with: @day.slot1
    fill_in "Slot2", with: @day.slot2
    fill_in "Slot3", with: @day.slot3
    fill_in "Slot4", with: @day.slot4
    fill_in "Slot5", with: @day.slot5
    fill_in "Slot6", with: @day.slot6
    fill_in "Slot7", with: @day.slot7
    fill_in "Slot8", with: @day.slot8
    fill_in "Status", with: @day.status
    fill_in "Tech", with: @day.tech_id
    click_on "Update Day"

    assert_text "Day was successfully updated"
    click_on "Back"
  end

  test "destroying a Day" do
    visit days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Day was successfully destroyed"
  end
end
