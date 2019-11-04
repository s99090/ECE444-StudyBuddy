class BuddiesController < ApplicationController
    def index
        @buddies = Buddy.all
    end

    def new
        @buddy = Buddy.new
    end

    def create
        @buddy = Buddy.new(params.require(:buddy).permit(:id, :username, :service, :description, :hourly_rate))
 
        @buddy.save
        redirect_to @buddy
    end

    def show
        @buddy = Buddy.find(params[:id])
    end
end
