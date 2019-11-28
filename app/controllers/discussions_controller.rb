class DiscussionsController < ApplicationController
  def index 
    @discussions = Discussion.all
    @full_discussions = Discussion.all
    @info = params["course_id"]
    @courses = Course.all
    @course = Course.find(params["course_id"])
    @discussions = Discussion.where(course_id: @course.id)
  end

  def new
      @discussions = Discussion.new
  end

  def edit
    @course = Course.find(params[:course_id])
    @discussion = @course.discussions.find(params[:id])
  end

  def create 
      @course = Course.find(params["course_id"])
      @discussion = Discussion.new(params.require(:discussion).permit(:discussion_name, :discussion_administrator, :initial_post, :course_id, :creater_id))
      @discussion.course_id = @course.id
      @discussion.creater_id = current_user.id
      #@discussion.discussion_id = @discussion.id
      # @discussion.save
      # redirect_to course_discussions_path
      if @discussion.save
        redirect_to course_discussion_path(@course, @discussion)
      else
        render 'new'
      end
  end

  def update
    @course = Course.find(params[:course_id])
    @discussion = @course.discussions.find(params[:id])

    if @discussion.creater_id == current_user.id
      if @discussion.update(params.require(:discussion).permit(:discussion_name, :discussion_administrator, :initial_post, :course_id, :creater_id))
        redirect_to course_discussion_path(@course, @discussion)
      else
        render 'edit'
      end
    else
      @discussion.errors[:base] << "Sorry, you are not the creater of this discussion!"
      render 'edit'
    end
  end
  
  def destroy
    @course = Course.find(params[:course_id])
    @discussion = @course.discussions.find(params[:id])

    if @discussion.creater_id == current_user.id
      @discussion.destroy
      redirect_to course_discussions_path(@course)
    else
      @discussion.errors[:base] << "Sorry, you are not the creater of this event!"
      render 'show'
    end
  end

  def show
      @course = Course.find(params[:course_id])
      @discussion = Discussion.find(params[:id])
      @comments = @discussion.comments.all
      @course = @discussion.course
      @comment = @discussion.comments.build
  end
end

