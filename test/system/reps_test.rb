require "application_system_test_case"

class RepsTest < ApplicationSystemTestCase
  setup do
    @rep = reps(:one)
  end

  test "visiting the index" do
    visit reps_url
    assert_selector "h1", text: "Reps"
  end

  test "creating a Rep" do
    visit reps_url
    click_on "New Rep"

    fill_in "Name", with: @rep.name
    fill_in "Pnum", with: @rep.pnum
    fill_in "Provider", with: @rep.provider
    check "Working" if @rep.working
    click_on "Create Rep"

    assert_text "Rep was successfully created"
    click_on "Back"
  end

  test "updating a Rep" do
    visit reps_url
    click_on "Edit", match: :first

    fill_in "Name", with: @rep.name
    fill_in "Pnum", with: @rep.pnum
    fill_in "Provider", with: @rep.provider
    check "Working" if @rep.working
    click_on "Update Rep"

    assert_text "Rep was successfully updated"
    click_on "Back"
  end

  test "destroying a Rep" do
    visit reps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rep was successfully destroyed"
  end
end
