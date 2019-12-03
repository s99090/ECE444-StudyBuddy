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
    # @note.noteFile.attach(params[:noteFile])
    # raise("BP")
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
    @noteFiles = [@note.noteFile]
  end

  def edit
    @note = Note.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def update
    @note = Note.find(params[:id])
    @note.noteFiles.attach(params[:noteFiles])
    if @note.update(note_params)
      redirect_to course_notes_path
    else
      render 'edit'
    end
  end

  def destroy
    Note.find(params[:id]).destroy
    flash[:info] = "Note deleted" 
    redirect_to course_notes_path
  end

  def addUpvote
    @course = Course.find(params[:course_id])
    @note = Note.find(params[:note_id])
    if not (@note.upvotes.include? (current_user.id).to_s)
       if not (@note.downvotes.include? (current_user.id).to_s)
            @note.upvotes << (current_user.id)
            @note.save
            redirect_to course_notes_path
       else
            
            @note.upvotes << (current_user.id)
            @note.downvotes.pop(current_user.id)
            @note.save
            redirect_to course_notes_path
       end
    else
        flash[:Notice] = "You have already upvoted this note"
        redirect_to course_notes_path
    end
    
end
def addDownvote
    @course = Course.find(params[:course_id])
    @note = Note.find(params[:note_id])
    if not (@note.downvotes.include? (current_user.id).to_s)
       if not (@note.upvotes.include? (current_user.id).to_s)
            @note.downvotes << (current_user.id)
            @note.save
            redirect_to course_notes_path
       else
            #need to raise an error here

            @note.downvotes << (current_user.id)
            @note.upvotes.pop(current_user.id)
            @note.save
            redirect_to course_notes_path
       end
    else
        flash[:Notice] = "You have already downvoted this note"
        redirect_to course_notes_path
    end
end

  private
    def note_params
        params.require(:note).permit(:title, :description, :noteFile)
    end
end
