require 'rails_helper'



describe CommentsController do 

  describe "POST #create" do 
    comment = create(:comment)
    post = comment.post

    it "properly creates a comment" do 
      Rails.logger.debug attributes_for(:comment).inspect
      expect{post :create, {post_id: post.id, comment: attributes_for(:comment) }}.to change(Comment, :count).by(1)
    end

  end


  describe "DELETE #destroy" do 

    it "destroys a comment if it is the current_users comment" do 
      comment = create(:comment)
      user = comment.user
      
      cookies[:auth_token] = user.auth_token

      expect{ delete :destroy, :id => comment.id}.to change(Comment, :count).by(-1)
    end

  end




end