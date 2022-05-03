class ReceiptsController < ApplicationController
  before_action :get_payment
  before_action :set_receipt, only: %i[ show edit update destroy ]

  # GET /receipts or /receipts.json
  def index
    @receipts = @payment.receipts
  end

  # GET /receipts/1 or /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = @payment.receipts.build
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts or /receipts.json
  def create

    @receipt = @payment.receipts.build(receipt_params)
    

    respond_to do |format|
      if @receipt.save
        ReceiptMailer.with(receipt: @receipt).welcome_email.deliver_later

        format.html { redirect_to payment_receipt_path(@payment, @receipt), notice: "Receipt was successfully created." }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to payment_receipt_path(@payment, @receipt), notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to payment_receipts_path(@payment), notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = @payment.receipts.find(params[:id])
    end

    def get_payment
      @payment = Payment.find(params[:payment_id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:payment_id, :recipient, :deliveryway, :address, :summary, :other)
    end
end
