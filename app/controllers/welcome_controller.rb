class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def welcome
  end

  def about
  end

  def contact
  end

  def sitemap
  end
  
  def faq
  end

  def termsandconditions
  end

  def privacy
  end

  def contact_us_submission

    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactUsMailer.new_issue(name, email, message).deliver_now

    flash[:notice] = "Thank you for contacting us!"
    redirect_to contact_path

  end


end
