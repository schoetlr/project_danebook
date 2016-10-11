require 'rails_helper'



describe LikesController do 
  let(:user){create(:user)}
  describe "POST #create" do 
    
    setup do
      @request.env['HTTP_REFERER'] = 'http://test.com/user/#{post.user_id}/posts'
        #post :create, { :user => { :email => 'invalid@abc' } }
    end
    

    it "creates a like for a signed in user" do 
      this_post = create(:post)

      

      cookies[:auth_token] = user.auth_token

      expect {post :create, post_id: this_post.id, like: attributes_for(:like)}.to change(Like, :count).by 1

    end


    

    



  end



  describe "DELETE #destroy" do 

    it "destroys a like if a signed in user unlikes a post they have liked" do 


    end


  end





end