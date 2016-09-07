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

  scenario "a user that is not signed in can not view anything besides the homepage" do 

    visit user_posts_path(1)

    expect(page).to have_content "Not signed in"


  end


end #user accounts