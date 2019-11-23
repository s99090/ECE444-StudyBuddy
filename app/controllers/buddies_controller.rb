class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.all
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(params.require(:buddy).permit(:id, :username, :fname, :lname, :description, :hourly_rate))

    if @buddy.save
      redirect_to @buddy
    else
      render 'new'
    end

  end

  def show
    @buddy = Buddy.find(params[:id])
  end
end
