require "application_system_test_case"

class TechniciansTest < ApplicationSystemTestCase
  setup do
    @technician = technicians(:one)
  end

  test "visiting the index" do
    visit technicians_url
    assert_selector "h1", text: "Technicians"
  end

  test "creating a Technician" do
    visit technicians_url
    click_on "New Technician"

    fill_in "Email", with: @technician.email
    fill_in "Working", with: @technician.working
    fill_in "Employeenum", with: @technician.employeeNum
    fill_in "Name", with: @technician.name
    fill_in "Other", with: @technician.other
    fill_in "Phone", with: @technician.phone
    click_on "Create Technician"

    assert_text "Technician was successfully created"
    click_on "Back"
  end

  test "updating a Technician" do
    visit technicians_url
    click_on "Edit", match: :first

    fill_in "Email", with: @technician.email
    fill_in "Working", with: @technician.working
    fill_in "Employeenum", with: @technician.employeeNum
    fill_in "Name", with: @technician.name
    fill_in "Other", with: @technician.other
    fill_in "Phone", with: @technician.phone
    click_on "Update Technician"

    assert_text "Technician was successfully updated"
    click_on "Back"
  end

  test "destroying a Technician" do
    visit technicians_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Technician was successfully destroyed"
  end
end
