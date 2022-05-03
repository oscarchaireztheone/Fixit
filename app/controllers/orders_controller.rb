class OrdersController < ApplicationController
  before_action :get_customer
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = @customer.orders
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = @customer.orders.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = @customer.orders.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to customer_orders_path(@customer), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to customer_order_path(@customer), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to customer_orders_path(@customer), notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @customer.orders.find(params[:id])
    end

    def get_customer
      @customer = Customer.find(params[:customer_id])
    end
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_id, :model, :serial, :brand, :callsid, :symptom, :status, :agent_id, :other, :address, :window, :technician_id, :day, :other, :invoiceNumber, :invoicetype, :laborCharge, :part, :amtDue, :taxAmt, :other)
    end
end
