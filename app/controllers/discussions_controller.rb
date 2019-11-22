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

  def create 
      @course = Course.find(params["course_id"])
      @discussion = Discussion.new(params.require(:discussion).permit(:discussion_id, :discussion_name, :discussion_administrator, :course_id))
      @discussion.course_id = @course.id
      @discussion.save
      redirect_to course_discussions_path
  end

  def show
      @course = Course.find(params[:course_id])
      @discussion = Discussion.find(params[:id])
      @course = @discussion.course
  end
end
