class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.all
    @courses = Course.all
  end

  def new
    @buddy = Buddy.new
  end

  def create

    @buddy = buddy_params

    if not @buddy.save or params[:buddy][:courses] == [""] or params[:buddy][:username] != current_user.username

      if params[:buddy][:courses] == [""]
        @buddy.errors.add(:courses, "can't be empty, you must select at least 1 course!")
      end

      if params[:buddy][:username] != current_user.username
        @buddy.errors.add(:courses, "must match current user that is signed in!")
      end

      render 'new'

    else

      @buddy.courses = gather_course_list.join(",")
      @buddy.set_confirmation_token
      @buddy.save

      deliver_signup_email
    end
  end

  def show
    @buddy = Buddy.find(params[:id])
  end

  def destroy

    @buddy = Buddy.find(params[:id])

    unless @buddy.nil?
      @buddy.destroy
    end

    flash[:notice] = "Your listing has been removed from the Buddies section."
    redirect_to user_profile_path(current_user.profile)

  end

  def confirm_email

    buddy = Buddy.find_by_confirm_token(params[:token])

    if buddy
      buddy.validate_email
      buddy.save(validate: false)
      flash[:notice] = "Thank you for signing up as a StudyBuddy!"
    else
      flash[:error] = "Invalid confirmation link."
    end

    redirect_to buddies_path
  end

  def add_interested

    @buddy = Buddy.find(params[:buddy_id])
    @user = User.find(params[:current_user_id])

    if @buddy.username != @user.username

      unless @buddy.interested_users.include?(params[:current_user_id])
        @buddy.interested_users.push(params[:current_user_id])
        @buddy.save
        NewInterestMailer.notify_buddy_about_new_interest(User.find_by_username(@buddy.username), User.find(params[:current_user_id])).deliver_now
      end

    end

  end

  private

  def deliver_signup_email
    SignupMailer.new_signup(current_user, @buddy).deliver_now
    flash[:notice] = "Thank you for signing up as a Buddy! A confirmation email has been sent."
    redirect_to buddies_path
  end

  def buddy_params
    Buddy.new(params.require(:buddy).permit(:id, :username, :fname, :lname, :description, :hourly_rate, :courses))
  end

  def gather_course_list
    s = []
    params[:buddy][:courses].each do |c|
      if c != ""
        s.push(Course.find(c).name)
      end
    end
    s
  end

end

