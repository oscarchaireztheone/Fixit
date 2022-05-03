require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  setup do
    @payment = payments(:one)
  end

  test "visiting the index" do
    visit payments_url
    assert_selector "h1", text: "Payments"
  end

  test "creating a Payment" do
    visit payments_url
    click_on "New Payment"

    fill_in "Amount", with: @payment.amount
    fill_in "Idnum", with: @payment.idNum
    fill_in "Meth", with: @payment.meth
    fill_in "Order", with: @payment.order_id
    fill_in "Other", with: @payment.other
    fill_in "Payee", with: @payment.payee
    click_on "Create Payment"

    assert_text "Payment was successfully created"
    click_on "Back"
  end

  test "updating a Payment" do
    visit payments_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @payment.amount
    fill_in "Idnum", with: @payment.idNum
    fill_in "Meth", with: @payment.meth
    fill_in "Order", with: @payment.order_id
    fill_in "Other", with: @payment.other
    fill_in "Payee", with: @payment.payee
    click_on "Update Payment"

    assert_text "Payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment" do
    visit payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment was successfully destroyed"
  end
end
