class EventsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @events = @group.events.all
  end

  def edit
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
  end

  def show
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])
    @comment = @event.comments.all
  end

  def new
    @group = Group.find(params[:group_id])
    @event = @group.events.build
  end

  def create
    @group = Group.find(params[:group_id])
    @event = @group.events.build(event_params)
    @event.creater_id = current_user.id

    if @event.save
      redirect_to group_event_path(@group, @event)
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])

    if @event.creater_id == current_user.id
      if @event.update(event_params)
        redirect_to group_event_path(@group, @event)
      else
        render 'edit'
      end
    else
      @event.errors[:base] << "Sorry, you are not the creater of this event!"
      render 'edit'
    end
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    @event = @group.events.find(params[:id])

    if @event.creater_id == current_user.id
      @event.destroy
      redirect_to group_path(@group)
    else
      @event.errors[:base] << "Sorry, you are not the creater of this event!"
      render 'show'
    end
  end

private
  def event_params
    params.require(:event).permit(:name, :content, :event_type, :datetime)
  end
end
