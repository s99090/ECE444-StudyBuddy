class GroupAnnouncementController < ApplicationController
    def index
        @group = Group.find(params["id"])
        @announcements = Announcements.where(id: @group.id)
    end

    def new
        @announcements = Announcement.new
    end

    def create
        @group = Group.find(params["id"])
        @announcement = Announcement.new(params.require(:announcements).permit(:announcements_title, :announcements_content, :id))
        @announcement.group_id = @group.id 
        @announcements.save
        redirect_to group_announcements_path
    end

    def show
        @group = Groups.find(params[:id])
        @announcement = Announcement.find(params[:id])
        @group = @announcements.group
    end

end
