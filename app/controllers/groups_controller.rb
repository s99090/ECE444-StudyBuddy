class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @group.users << current_user
      redirect_to @group
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.users.exists?(current_user.id)
      if @group.update(group_params)
        redirect_to @group
      else
        render 'edit'
      end
    else
      @group.errors[:base] << "Sorry, you are not the member of this group!"
      render 'edit'
    end
  end
  
  def join
    @group = Group.find(params[:id])
    
    if @group.users.exists?(current_user.id)
      @group.users.delete(current_user)
      if not @group.users.any?
        destroy
      end
      redirect_to groups_path
    else
      @group.users << current_user
      redirect_to @group
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

private
  def group_params
    params.require(:group).permit(:name, :text)
  end
end
