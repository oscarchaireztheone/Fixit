
class SamsungcallsController < ApplicationController
  include TwilioActionsHelper
  skip_before_action :verify_authenticity_token, only: [:api]
  before_action :authenticate_token, only: [:api]
  before_action :set_samsungcall, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_crew!, except: [:api] #devise helper
  before_action :set_user_id, except: [:api]


  API_BASE_URL = ENV["API_BASE_URL"]


  # GET /samsungcalls
  # GET /samsungcalls.json
  def index
    
    @samsungcalls = Samsungcall.all
  end

  # GET /samsungcalls/1
  # GET /samsungcalls/1.json
  def show
  end

  # GET /samsungcalls/new
  def new
    @samsungcall = Samsungcall.new
  end

  # GET /samsungcalls/1/edit
  def edit
  end

  # POST /samsungcalls
  # POST /samsungcalls.json
  def create
    @samsungcall = Samsungcall.new(samsungcall_params)

    respond_to do |format|
      if @samsungcall.save
        format.html { redirect_to @samsungcall, notice: 'Samsungcall was successfully created.' }
        format.json { render :show, status: :created, location: @samsungcall }
      else
        format.html { render :new }
        format.json { render json: @samsungcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samsungcalls/1
  # PATCH/PUT /samsungcalls/1.json
  def update
    respond_to do |format|
      if @samsungcall.update(samsungcall_params)
        format.html { redirect_to @samsungcall, notice: 'Samsungcall was successfully updated.' }
        format.json { render :show, status: :ok, location: @samsungcall }
      else
        format.html { render :edit }
        format.json { render json: @samsungcall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samsungcalls/1
  # DELETE /samsungcalls/1.json
  def destroy
    @samsungcall.destroy
    respond_to do |format|
      format.html { redirect_to samsungcalls_url, notice: 'Samsungcall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # API controller action for CRUD actions
  def api
    respond_to do |format|
      format.json {
        case request.method_symbol
        when :get
        if params[:id]
          @samsungcall = Samsungcall.find(params[:id])
          render json: @samsungcall
        else
          @samsungcalls = Samsungcall.all
          render json: @samsungcalls
        end
        when :post
          @samsungcall = Samsungcall.new(samsungcall_params)
          if @samsungcall.save
            render json: @samsungcall, status: :created
          else
            render json: @samsungcall.errors, status: :unprocessable_entity
          end
        when :put, :patch
          @samsungcall = Samsungcall.find(params[:id])
          if @samsungcall.update(samsungcall_params)
            render json: @samsungcall, status: :ok
          else
            render json: @samsungcall.errors, status: :unprocessable_entity
          end
        when :delete
          @samsungcall = Samsungcall.find(params[:id])
          @samsungcall.destroy
          head :no_content
        end
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_samsungcall
      @samsungcall = Samsungcall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def samsungcall_params
      params.require(:samsungcall).permit(:fourk, :name, :phone1, :phone2, :email, :address, :zipcode, :hass, :status, :note, :flag, :day_id)
    end
end
