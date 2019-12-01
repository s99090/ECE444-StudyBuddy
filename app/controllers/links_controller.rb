class LinksController < ApplicationController
    def index 
        @courses = Course.all
        @course = Course.find(params["course_id"])
        # @links = Link.where(course_id: @course.id)
        @links = @course.links.all
        @abc = @course.links.all
    end

    def new
        @course = Course.find(params[:course_id])
        @links = @course.links.build
    end

    def create 
        @course = Course.find(params["course_id"])
        @link = @course.links.build(params.require(:link).permit(:link_name, :link_url, :course_id, :creater_id))
        @link.course_id = @course.id
        @link.creater_id = current_user.id

        if @link.save
            redirect_to course_links_path
          else
            render 'new'
          end
    end

    def show
        @course = Course.find(params[:course_id])
        @link = Link.find(params[:id])
        @abc = @course.links.all
    end

    def addUpvote
        @course = Course.find(params[:course_id])
        @link = Link.find(params[:link_id])
        if not (@link.upvotes.include? (current_user.id).to_s)
           if not (@link.downvotes.include? (current_user.id).to_s)
                @link.upvotes << (current_user.id)
                @link.save
                redirect_to course_links_path
           else
                puts "already downvoted this link"
                @link.upvotes << (current_user.id)
                @link.downvotes.pop(current_user.id)
                @link.save
                redirect_to course_links_path
           end
        end
        # redirect_to course_link_path(@course, @link)
    end
    def addDownvote
        @course = Course.find(params[:course_id])
        @link = Link.find(params[:link_id])
        if not (@link.downvotes.include? (current_user.id).to_s)
           if not (@link.upvotes.include? (current_user.id).to_s)
                @link.downvotes << (current_user.id)
                @link.save
                redirect_to course_links_path
           else
                #need to raise an error here
                puts "already upvoted this link"
                @link.downvotes << (current_user.id)
                @link.upvotes.pop(current_user.id)
                @link.save
                redirect_to course_links_path
           end
        else
            puts "already downvoted this link"
        end
    end
end



