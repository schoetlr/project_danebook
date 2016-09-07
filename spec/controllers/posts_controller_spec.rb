require "rails_helper"



describe PostsController do 
  
  
  let(:user){create(:user)}

  describe "POST #create" do 
    
    it "creates a Post" do 

      cookies[:auth_token] = user.auth_token

      expect {post :create, user_id: user.id, post: attributes_for(:post)}.to change(Post, :count).by 1

    end


  end


  # describe "GET #index" do 
  #   it "properly sets the instance variables" do 
  #     post_list = create_list(:post, 5)
  #     post_list_user = post_list.first.user

  #     get :index, :user_id => post_list_user.id
  #     expect(assigns(:posts)).to eq(post_list.first)

  #   end

  # end






end