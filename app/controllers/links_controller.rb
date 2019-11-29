class LinksController < ApplicationController
    def index 
        @links = Link.all
        @full_links = Link.all
        @info = params["course_id"]
        @courses = Course.all
        @course = Course.find(params["course_id"])
        @links = Link.where(course_id: @course.id)
    end

    def new
        @links = Link.new
    end

    def create 
        @course = Course.find(params["course_id"])
        @link = Link.new(params.require(:link).permit(:link_name, :link_url, :course_id, :creater_id))
        @link.course_id = @course.id
        @link.creater_id = current_user.id
        @link.save
        redirect_to course_links_path
    end

    def show
        @course = Course.find(params[:course_id])
        @link = Link.find(params[:id])
        @course = @link.course
    end
end
