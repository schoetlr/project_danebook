require 'rails_helper'



describe UsersController do 
  let(:user){create(:user)}
      
  describe "GET #show" do 
    
    before { get :show, :id => user.id }

    it "set the correct instance variable" do 
      expect(assigns(:user)).to eq user
    end

  end


  describe "POST create" do 

    it "properly creates a user" do 
      expect {post :create, user: attributes_for(:user)}.to change(User, :count).by(1)
    end


    it "does not create a user when passed invalid attributes" do 
      expect {post :create, user: attributes_for(:user, password: nil)}.to change(User, :count).by(0)

      expect(response).to redirect_to root_path
    end


  end



end