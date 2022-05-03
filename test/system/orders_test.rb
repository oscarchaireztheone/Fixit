require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address", with: @order.address
    fill_in "Agent", with: @order.agent_id
    fill_in "Amtdue", with: @order.amtDue
    fill_in "Brand", with: @order.brand
    fill_in "Callsid", with: @order.callsid
    fill_in "Customer", with: @order.customer_id
    fill_in "Day", with: @order.day
    fill_in "Invoicenumber", with: @order.invoiceNumber
    fill_in "Invoicetype", with: @order.invoicetype
    fill_in "Laborcharge", with: @order.laborCharge
    fill_in "Model", with: @order.model
    fill_in "Other", with: @order.other
    fill_in "Part", with: @order.part
    fill_in "Serial", with: @order.serial
    fill_in "Status", with: @order.status
    fill_in "Symptom", with: @order.symptom
    fill_in "Taxamt", with: @order.taxAmt
    fill_in "Technician", with: @order.technician_id
    fill_in "Window", with: @order.window
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "Agent", with: @order.agent_id
    fill_in "Amtdue", with: @order.amtDue
    fill_in "Brand", with: @order.brand
    fill_in "Callsid", with: @order.callsid
    fill_in "Customer", with: @order.customer_id
    fill_in "Day", with: @order.day
    fill_in "Invoicenumber", with: @order.invoiceNumber
    fill_in "Invoicetype", with: @order.invoicetype
    fill_in "Laborcharge", with: @order.laborCharge
    fill_in "Model", with: @order.model
    fill_in "Other", with: @order.other
    fill_in "Part", with: @order.part
    fill_in "Serial", with: @order.serial
    fill_in "Status", with: @order.status
    fill_in "Symptom", with: @order.symptom
    fill_in "Taxamt", with: @order.taxAmt
    fill_in "Technician", with: @order.technician_id
    fill_in "Window", with: @order.window
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
