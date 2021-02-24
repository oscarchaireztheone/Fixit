class RepsController < ApplicationController
  before_action :set_rep, only: [:show, :edit, :update, :destroy]

  # GET /reps
  # GET /reps.json
  def index
    @reps = Rep.all
  end

  # GET /reps/1
  # GET /reps/1.json
  def show
  end

  # GET /reps/new
  def new
    @rep = Rep.new
  end

  # GET /reps/1/edit
  def edit
  end

  # POST /reps
  # POST /reps.json
  def create
    @rep = Rep.new(rep_params)

    respond_to do |format|
      if @rep.save
        format.html { redirect_to @rep, notice: 'Rep was successfully created.' }
        format.json { render :show, status: :created, location: @rep }
      else
        format.html { render :new }
        format.json { render json: @rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reps/1
  # PATCH/PUT /reps/1.json
  def update
    respond_to do |format|
      if @rep.update(rep_params)
        format.html { redirect_to @rep, notice: 'Rep was successfully updated.' }
        format.json { render :show, status: :ok, location: @rep }
      else
        format.html { render :edit }
        format.json { render json: @rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reps/1
  # DELETE /reps/1.json
  def destroy
    @rep.destroy
    respond_to do |format|
      format.html { redirect_to reps_url, notice: 'Rep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rep
      @rep = Rep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rep_params
      params.require(:rep).permit(:name, :working, :pnum, :provider)
    end
end
