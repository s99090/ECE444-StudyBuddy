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
      flash[:alert] = "Not Saved"
      render 'new'
    end
    # if @note.save
    #   redirect_to @note
    #   puts 'saved'
    # else
    #   puts 'failed'
    #   render 'new'
    # end
  end

  def show
    @note = Note.find(params[:id])
    @course = Course.find(params["course_id"])
  end

  private
    def note_params
      params.require(:note).permit(:note_id, :title, :author, :description)
      # params.require(:note).permit(:title, :description)
    end
end
