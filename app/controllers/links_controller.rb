class LinksController < ApplicationController
    def index 
        @links = Link.all
    end

    def new
        @links = Link.new
    end

    def create 
        @link = Link.new(params.require(:link).permit(:link_name, :link_url))
        @link.save
        redirect_to @link
    end

    def show
        @link = Link.find(params[:id])
    end
end
