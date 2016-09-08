require 'rails_helper'


describe Friending do 

  let(:user){create(:user)}
  let(:another_user){create(:user)}

  before do 
    visit root_path
    sign_in user
  end

  describe "A user is signed in" do 

    specify "user and another_user are different" do 
      expect(user.id == another_user.id).to be false
    end
    
    it "can friend another_user" do 
      another_user
      
      visit user_path(another_user.id)
     #the friending link is not displaying so it is clicking Friends not Friend
      expect{click_link("Friend")}.to change(user.friended_users, :count).by(1)
    end


    it "can unfriend another user" do 
      visit user_path(another_user.id)
      click_link("Friend")

      expect{click_link("Unfriend")}.to change(user.friended_users, :count).by(-1)
    end


  end





end