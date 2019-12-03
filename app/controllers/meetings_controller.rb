class MeetingsController < ApplicationController
  # before_action :checkIfAllowed

  # def checkIfAllowed
  #   @buddy = Buddy.find(params[:buddy_id])
  #   if @buddy.username != current_user.username && current_user.username != "borhterbeat" #or @buddy.interested_users.include?(current_user.username)
  #     @buddy.errors.add(:courses, "You are not allowed to be here")
  #     puts current_user.username
  #     redirect_to buddies_path
  #   end
  # end

  def index
    # puts("ASDSADSAD")
    # puts(params)
    @buddy = Buddy.find(params[:buddy_id])
    if @buddy.username != current_user.username
      redirect_to buddies_path
    end
    @meetings = @buddy.meetings.all
  end

  def edit
    @buddy = Buddy.find(params[:buddy_id])
    if @buddy.username != current_user.username
      redirect_to buddies_path
    end

    @meeting = @buddy.meetings.find(params[:id])
  end

  def show
    @buddy = Buddy.find(params[:buddy_id])
    @meeting = @buddy.meetings.find(params[:id])

    unless @buddy.username == current_user.username || current_user.id == @meeting.invitee.to_i
      # raise ""
      redirect_to buddies_path
    end

    @comments = @meeting.comments.all
    @comment = @meeting.comments.build
  end

  def new
    @buddy = Buddy.find(params[:buddy_id])
    if @buddy.username != current_user.username
      redirect_to buddies_path
    end

    @meeting = @buddy.meetings.build
  end

  def create
    @buddy = Buddy.find(params[:buddy_id])
    if @buddy.username != current_user.username
      redirect_to buddies_path
    end
    @meeting = @buddy.meetings.build(params.require(:meeting).permit(:name, :initial_post)) #have to fix this
    @meeting.invitee = params[:meeting][:users]
    @meeting.meeting_token = SecureRandom.urlsafe_base64.to_s

    if params[:meeting][:users] != "" && @meeting.save

      redirect_to buddy_meeting_path(@buddy, @meeting)
      #we need to send a notification to the user that there was a meeting created
    else
      if params[:meeting][:users] == ""
        @meeting.errors.add(:invitee, "can't be empty, you must select a invitee!")
      end
      render 'new'
    end
  end

  def update
    @buddy = Buddy.find(params[:buddy_id])
    if @buddy.username != current_user.username
      redirect_to buddies_path
    end
    @meeting = @buddy.meetings.find(params[:id])


    if @meeting.update(params.require(:meeting).permit(:name, :initial_post))
      redirect_to buddy_meeting_path(@buddy, @meeting)
    else
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

end
