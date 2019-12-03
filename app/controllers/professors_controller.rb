class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @courses = Course.where(professor: @professor.name)
    @blank_stars = 5 - @professor.rating.to_i
    if @professor.avatar.present?
    else
      @professor.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/default_profile.png"), filename: 'default_profile.png')
    end
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      redirect_to @professor
    else
      render 'new'
    end
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    @professor = Professor.find(params[:id])

    if @professor.update(professor_params)
      redirect_to @professor
    else
      render 'edit'
    end
  end

  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy
    redirect_to '/professors'
  end

  private
  
  def professor_params
    params.require(:professor).permit(:name, :department, :position, :about, :avatar, :rating)
  end
end
