class LikesController < ApplicationController
  
  def create
    @likeable = extract_likeable
    @like = @likeable.likes.build
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


  private


  def extract_likeable
    resource, id = request.path.split('/')[1,2]

    resource.singularize.classify.constantize.find(id)
  end


end
