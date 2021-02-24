class WebCallsController < ApplicationController
  before_action :set_web_call, only: [:show, :edit, :update, :destroy]

  # GET /web_calls
  # GET /web_calls.json
  def index
    @web_calls = WebCall.all
  end

  # GET /web_calls/1
  # GET /web_calls/1.json
  def show
        @web_call = WebCall.new


  end

  # GET /web_calls/new
  def new
    @web_call = WebCall.new
  end

  # GET /web_calls/1/edit
  def edit
  end

  # POST /web_calls
  # POST /web_calls.json
  def create
    @web_call = WebCall.new(web_call_params)

    

    respond_to do |format|
      if @web_call.save
        format.html { redirect_to root_path, notice: 'Thank you we will contact you soon'}
        format.json { render :show, status: :created, location: @web_call }
      else
        format.html { render :new }
        format.json { render json: @web_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_calls/1
  # PATCH/PUT /web_calls/1.json
  def update
    respond_to do |format|
      if @web_call.update(web_call_params)
        format.html { redirect_to @web_call, notice: 'Web call was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_call }
      else
        format.html { render :edit }
        format.json { render json: @web_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_calls/1
  # DELETE /web_calls/1.json
  def destroy
    @web_call.destroy
    respond_to do |format|
      format.html { redirect_to web_calls_url, notice: 'Web call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_call
      @web_call = WebCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def web_call_params
      params.require(:web_call).permit(:name, :zipcode, :Appliance, :asap, :timestart, :timeend, :closed)
    end
end
