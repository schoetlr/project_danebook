class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    @commentable = extract_commentable
    @comment = @commentable.comments.build(whitelisted_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created"

      respond_to do |format|
        format.html{ redirect_to :back }

        format.js { render :create_success }
      end
      
    else
      flash[:error] = "Something went wrong"
      
      respond_to do |format|
        format.html { redirect_to :back }

        format.js { redirect_to :back }
      end
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

  def extract_commentable
    resource, id = request.path.split('/')[1,2]

    resource.singularize.classify.constantize.find(id)
  end

  def whitelisted_params
    params.require(:comment).permit(:content)
  end
end
