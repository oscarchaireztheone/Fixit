class DaysController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:api]
  before_action :set_day, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_crew!, except: [:api]
  before_action :set_user_id, except: [:api]

  # GET /days
  # GET /days.json
  def index
    @days = Day.all
  end

  # GET /days/1
  # GET /days/1.json
  def show
  end

  # GET /days/new
  def new
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  # POST /days.json
  def create
    @day = Day.new(day_params)

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def api
    respond_to do |format|
      format.json {
        case request.method_symbol
        when :get
          @days = Day.all
          render json: @days
        when :post
          @day = Day.new(day_params)
          Rails.logger.warn(day_params.day_id)
          if @day.save
            render json: @day, status: :created
          else
            render json: @day.errors, status: :unprocessable_entity
          end
        when :put, :patch
          @samsungcall = Samsungcall.find_by(id: params[:call_id])
          Rails.logger.warn("Here is the samsung call #{@samsungcall.name}")
          @day = Day.find(params[:id])
          Rails.logger.warn "From within the update"
          if @day.update(day_params)
            @samsungcall.update(day_id: @day.id)
            render json: @day, status: :ok
          else
            render json: @day.errors, status: :unprocessable_entity
          end
        when :delete
          @day = Day.find(params[:id])
          @day.destroy
          head :no_content
        end
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def day_params
      params.require(:day).permit(:date, :tech_id, :status, :slot1, :slot2, :slot3, :slot4, :slot5, :slot6, :slot7, :slot8)
    end
end
