class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:api]
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_crew!, except: [:api]
  before_action :set_user_id, except: [:api]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def api
    respond_to do |format|
      format.json {
        case request.method_symbol
        when :get
          if params[:id]
          @samsungcall = Samsungcall.find(params[:id])
          render json: @samsungcall
          else
          @note = Note.all
          render json: @notes
          end

        when :post
          @note = Note.new(note_params)
          if @note.call_id.present?
            @note.status = 1
          else
            @note.status = 0
          end
          if @note.save
   render json: @note, status: :created
          else
            render json: @note.errors, status: :unprocessable_entity
          end
        end
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:note_content, :phone_number, :call_id, :status)
    end
end
