class NotesController < ApplicationController
  def index
    @course = Course.find(params["course_id"])
    @notes = Note.where(course_id: @course.id)
  end

  def new
    @note = Note.new
  end

  def create
    @course = Course.find(params["course_id"])
    @note = Note.new(note_params)
    @note.course_id = @course.id
    if @note.save
      flash[:success] = "Saved!"
      redirect_to course_notes_path
    else
      flash[:alert] = "Note was not saved"
      #TODO: add more flash types (e.g. "add_flash_types :danger :myflashtype2") and return more specific error
      render 'new'
    end
  end

  def show
    @note = Note.find(params[:id])
    @course = Course.find(params["course_id"])
  end

  private
    def note_params
      params.require(:note).permit(:note_id, :title, :author, :description)
    end
end
