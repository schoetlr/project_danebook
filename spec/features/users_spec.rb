require 'rails_helper'



feature "User accounts" do 

  before do 
    visit root_path
  end

  let(:user) {create(:user)}
  

  scenario "create a new user" do 
    fill_in "firstName", with: "First"
    fill_in "lastName", with: "Last"
    fill_in "signup-email", with: "email@email.com"
    fill_in "signup-password", with: "superpassword"
    fill_in "signup-password-confirm", with: "superpassword"
    #skip birthday=>fill_in "birthday", with: 
    #skip gender
    expect{ click_button "Sign Up!"}.to change(User, :count).by(1)


  end

  scenario "sign in an existing user" do
    
    sign_in(user)
    expect(page).to have_content "Signed in successfully"
  end

  describe "Secure pages can't be visited by not signed in users" do 
    #covers most sad paths because unsigned users can't visit
    #any pages besides root_path
    scenario "can not view timelines" do 

      visit user_posts_path(1)

      expect(page).to have_content "Not signed in"


    end

    scenario "can not not view about pages" do
      visit user_path(user)

      expect(page).to have_content "Need to be logged in"

    end
  end


end #user accounts