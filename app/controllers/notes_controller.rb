class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  before_action { authorize(@note || Note) }

  # GET /notes or /notes.json
  def index
    @notes = current_user.notes.page(params[:page]).per(10)
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @game = Game.find(params[:game_id])
    @note = @game.children.build
  end

  # GET /notes/1/edit
  def edit
    @game = Game.find(params[:game_id])
    @note = Note.find_by(parent_id: @game.id)
  end

  # POST /notes or /notes.json
  def create
    @game = Game.find(params[:game_id])
    @note = @game.children.build(note_params)
    @note.author_id = current_user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to game_note_path(@game, @note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to game_note_path(@note.parent, @note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy!
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:content, :author_id, :parent_id)
  end
end
