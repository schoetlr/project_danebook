class FriendingsController < ApplicationController

  def create
    friend_recipient = User.find(params[:friend_id])

    if current_user.friended_users << friend_recipient
      flash[:success] = "Sucessfully friended"
      redirect_to user_path(friend_recipient)
    else
      flash[:error] = "Could not friend User"
      redirect_to :back
    end 
  end

  def destroy
    unfriended = User.find(params[:id])

    current_user.friended_users.delete(unfriended)
    flash[:success] = "Successfully unfreinded"
    redirect_to :back
  end
end
