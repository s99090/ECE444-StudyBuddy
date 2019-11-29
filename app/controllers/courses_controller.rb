class CoursesController < ApplicationController
    def index 
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create 
        @course = Course.new(params.require(:course).permit(:name, :subject, :term, :course_code, :students, :notes, :links, :discussions, :groups))
        puts @course
        @course.save
        redirect_to @course
    end

    def show
        @course = Course.find(params[:id])
    end
end
