class CommentsController < ApplicationController
  def create
    session[:return_to] = request.referer
    @commentable = get_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.creater_id = current_user.id
    if @comment.save
      redirect_to session[:return_to]
    else
      redirect_to session[:return_to]
    end
  end

  # def update
  #   @commentable = get_commentable
  #   @comment = @commentable.comments.find(params[:id])
  #   if @comment.creater_id == current_user.id
  #     if @comment.update(comment_params)
  #       redirect_to session[:return_to]
  #     else
  #       render session[:return_to]
  #     end
  #   else
  #     @event.errors[:base] << "Sorry, you are not the creater of this comment!"
  #     render session[:return_to]
  #   end
  # end

  def destroy
    session[:return_to] = request.referer
    @commentable = get_commentable
    if not @commentable.comments.exists?(params[:id])
      redirect_to session[:return_to] and return
    end
    @comment = @commentable.comments.find(params[:id])
    if @comment.creater_id == current_user.id
      @comment.destroy
      redirect_to session[:return_to]
    else
      @comment.errors[:base] << "Sorry, you are not the creater of this comment!"
      redirect_to session[:return_to]
    end
  end

private
  def get_commentable
    params.each do |name, value|
      if name == "event_id"
        return Event.find(value)
      elsif name == "discussion_id"
        return Discussion.find(value)
      elsif name == "groupchat_id"
        return Groupchat.find(value)
      end
    end
    nil 
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
