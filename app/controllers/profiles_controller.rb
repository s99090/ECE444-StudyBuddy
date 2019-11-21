class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
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
    params.require(:profile).permit(:lname, :fname)
  end
end
