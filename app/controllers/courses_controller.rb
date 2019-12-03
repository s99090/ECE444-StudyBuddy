class CoursesController < ApplicationController
    def index 
        @courses = Course.all
        @professors = Professor.all
    end

    def new
        @course = Course.new
    end

    def create 
        @professors = Professor.all
        @course = Course.new(params.require(:course).permit(:name, :subject, :term, :course_code, :students, :notes, :links, :discussions, :groups, :description, :professor))
        puts @course
        if @course.save
            @course.professor << params[:course][:professor]
            redirect_to @course
        else 
            redirect_to new
        end
    end

    def edit
        @course = Course.find(params[:id])
      end
    
      def update
        @course = Course.find(params[:id])
    
        if @course.update(params.require(:course).permit(:name, :subject, :term, :course_code, :students, :notes, :links, :discussions, :groups, :description, :professor))
          redirect_to @course
        else
          render 'edit'
        end
      end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to '/courses'
      end

    def show
        @course = Course.find(params[:id])
        @professor = Professor.find_by(name: @course.professor)
    end
end
