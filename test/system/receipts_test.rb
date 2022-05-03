require "application_system_test_case"

class ReceiptsTest < ApplicationSystemTestCase
  setup do
    @receipt = receipts(:one)
  end

  test "visiting the index" do
    visit receipts_url
    assert_selector "h1", text: "Receipts"
  end

  test "creating a Receipt" do
    visit receipts_url
    click_on "New Receipt"

    fill_in "Address", with: @receipt.address
    fill_in "Deliveryway", with: @receipt.deliveryway
    fill_in "Other", with: @receipt.other
    fill_in "Payment", with: @receipt.payment_id
    fill_in "Recipient", with: @receipt.recipient
    fill_in "Summary", with: @receipt.summary
    click_on "Create Receipt"

    assert_text "Receipt was successfully created"
    click_on "Back"
  end

  test "updating a Receipt" do
    visit receipts_url
    click_on "Edit", match: :first

    fill_in "Address", with: @receipt.address
    fill_in "Deliveryway", with: @receipt.deliveryway
    fill_in "Other", with: @receipt.other
    fill_in "Payment", with: @receipt.payment_id
    fill_in "Recipient", with: @receipt.recipient
    fill_in "Summary", with: @receipt.summary
    click_on "Update Receipt"

    assert_text "Receipt was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt" do
    visit receipts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt was successfully destroyed"
  end
end
