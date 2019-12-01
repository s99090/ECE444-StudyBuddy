require 'sendgrid-ruby'
include SendGrid

class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.all
  end

  def new
    @buddy = Buddy.new
  end

  def create

    @buddy = Buddy.new(params.require(:buddy).permit(:id, :username, :fname, :lname, :description, :hourly_rate, :courses))

    if not @buddy.save or params[:buddy][:courses] == [""] #or params[:buddy][:username] != current_user.username

      if params[:buddy][:courses] == [""]
        @buddy.errors.add(:courses, "can't be empty, you must select at least 1 course!")
      end

      # if params[:buddy][:username] != current_user.username
      #   @buddy.errors.add(:courses, "must match current user that is signed in!")
      # end

      render 'new'

    else

      s = []
      params[:buddy][:courses].each do |c|
        if c != ""
          s.push(Course.find(c).name)
        end
      end

      @buddy.courses = s.join(",")
      @buddy.set_confirmation_token
      @buddy.save

      SignupMailer.new_signup(current_user, @buddy).deliver_now

      redirect_to @buddy

    end

  end

  def show
    @buddy = Buddy.find(params[:id])
  end

  def confirm_email
    user = Buddy.find_by_confirm_token(params[:token])

    if user
      user.validate_email
      user.save(validate: false)
      flash[:notice] = "Thank you for signing up as a StudyBuddy!"
    else
      flash[:error] = "Sorry. User does not exist"

    end

    redirect_to root_url
  end

end

