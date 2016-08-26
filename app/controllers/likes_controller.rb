class LikesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like[:user_id] = current_user.id
    if @like.save
      flash[:success] = "Successfully liked post"
      redirect_to :back
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end


end
