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
    @note.user = current_user
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

  def edit
    @note = Note.find(params[:id])
    @course = Note.find(params[:course_id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to course_notes_path
    else
      render 'edit'
    end
  end
  

  private
    def note_params
        params.require(:note).permit(:title, :description)
    end
end
