class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(whitelisted_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to :back
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    user = @comment.user
    if @comment.destroy
      flash[:success] = "Comment destroyed"
      redirect_to user_posts_path(user)
    else
      flash[:error] = "Comment could not be destroyed"
      redirect_to :back
    end
  end


  private

  def whitelisted_params
    params.require(:comment).permit(:post_id, :content)
  end
end
