class CoursesController < ApplicationController
    def index 
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create 
        @professors = Professor.all
        @course = Course.new(params.require(:course).permit(:name, :subject, :term, :course_code, :studenpts, :notes, :links, :discussions, :groups, :description, :professor))
        puts @course
        if @course.save
            @course.professor << params[:course][:professor]
            redirect_to @course
        else 
            redirect_to new
        end
    end

    def show
        @course = Course.find(params[:id])
        @professor = Professor.find_by(name: @course.professor)
    end
end
