require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @order.address, agent_id: @order.agent_id, amtDue: @order.amtDue, brand: @order.brand, callsid: @order.callsid, customer_id: @order.customer_id, day: @order.day, invoiceNumber: @order.invoiceNumber, invoicetype: @order.invoicetype, laborCharge: @order.laborCharge, model: @order.model, other: @order.other, part: @order.part, serial: @order.serial, status: @order.status, symptom: @order.symptom, taxAmt: @order.taxAmt, technician_id: @order.technician_id, window: @order.window } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, agent_id: @order.agent_id, amtDue: @order.amtDue, brand: @order.brand, callsid: @order.callsid, customer_id: @order.customer_id, day: @order.day, invoiceNumber: @order.invoiceNumber, invoicetype: @order.invoicetype, laborCharge: @order.laborCharge, model: @order.model, other: @order.other, part: @order.part, serial: @order.serial, status: @order.status, symptom: @order.symptom, taxAmt: @order.taxAmt, technician_id: @order.technician_id, window: @order.window } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
