class CommentsController < ApplicationController

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


  private

  def whitelisted_params
    params.require(:comment).permit(:post_id, :content)
  end
end
