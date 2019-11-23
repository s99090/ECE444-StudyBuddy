class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
    if @profile == nil
      @profile = @user.create_profile
      @profile.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/default_profile.png"), filename: 'default_profile.png')
    end
  end

  # def new
  #   @profile = Profile.new
  # end

  # def create
  #   @profile = Profile.new(profile_params)
  #   @profile.user_id = current_user.id
  #   if @profile.save
  #     redirect_to user_profile_path
  #   end
  # end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
   
    if @profile.update(profile_params)
      redirect_to user_profile_path
    else
      render 'edit'
    end
  end
  
private
  def profile_params
    params.require(:profile).permit(:lname, :fname, :avatar)
  end
end
