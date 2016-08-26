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


  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:success] = "Like successfully destroyed"
      redirect_to :back
    else 
      flash[:error] = "Couldn't unlike post"
      redirect_to :back
    end
  end


end
