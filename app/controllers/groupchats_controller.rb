class GroupchatsController < ApplicationController
    def index 
        @group = Group.find(params["group_id"])
        redirect_to group_path(@group)
        # @groupchats = Groupchat.all
        # @full_discussions = Groupchat.all
        # @info = params["group_id"]
        # @courses = Group.all
        # @group = Group.find(params["group_id"])
        # @groupchats = Groupchat.where(group_id: @group.id)
    end
    
    def new
        @groupchats = Groupchat.new
    end
    
    def edit
        @group = Group.find(params[:group_id])
        @groupchat = @group.groupchats.find(params[:id])
    end
    
    def create 
        @group = Group.find(params["group_id"])
        @groupchat = Groupchat.new(params.require(:groupchat).permit(:groupchat_name, :groupchat_administrator, :initial_post, :group_id, :creater_id))
        @groupchat.group_id = @group.id
        @groupchat.creater_id = current_user.id
        #@groupchat.discussion_id = @groupchat.id
        # @groupchat.save
        # redirect_to course_discussions_path
        if @groupchat.save
            redirect_to group_groupchat_path(@group, @groupchat)
        else
            render 'new'
        end
    end
    
    def update
        @group = Group.find(params[:group_id])
        @groupchat = @group.discussions.find(params[:id])
    
        if @groupchat.creater_id == current_user.id
        if @groupchat.update(params.require(:discussion).permit(:discussion_name, :discussion_administrator, :initial_post, :group_id, :creater_id))
            redirect_to group_groupchat_path(@group, @groupchat)
        else
            render 'edit'
        end
        else
        @groupchat.errors[:base] << "Sorry, you are not the creater of this discussion!"
        render 'edit'
        end
    end
    
    def destroy
        @group = Group.find(params[:group_id])
        @groupchat = @group.groupchats.find(params[:id])
    
        if @groupchat.creater_id == current_user.id
        @groupchat.destroy
        redirect_to group_groupchats_path(@group)
        else
        @groupchat.errors[:base] << "Sorry, you are not the creater of this event!"
        render 'show'
        end
    end
    
    def show
        @group = Group.find(params[:group_id])
        @groupchat = Groupchat.find(params[:id])
        @comments = @groupchat.comments.all
        @group = @groupchat.group
        @comment = @groupchat.comments.build
    end
end
      
      

