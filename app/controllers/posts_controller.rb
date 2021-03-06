class PostsController < ApplicationController
  before_action :require_current_user, only: [:create, :destroy, :index]

  def index
  
    @user = User.find(params[:user_id])
    @post = current_user.posts.new if current_user
    @posts = @user.posts.order(created_at: "desc")
    @photos = @user.photos
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(whitelisted_params)
    
    if @post.save
      flash[:success] = "Post successfully created"
      
      respond_to do |format|
        format.html { redirect_to user_posts_path(@user.id) }

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
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    
    if @post.destroy
      flash[:success] = "Post successfully destroyed"
      redirect_to user_posts_path(@user)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end


  private


  def require_current_user
    if current_user.nil?
      flash[:error] = "Not signed in"
      redirect_to root_path and return
    end

    unless params[:user_id] != current_user.id  
      flash[:error] = "Not signed in"
      redirect_to :back
    end
  end

  def whitelisted_params
    params.require(:post).permit(:content, :user_id)
  end
end
