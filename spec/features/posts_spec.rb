require 'rails_helper'



feature "Posting" do 

  before do 
    visit root_path
  end

  let(:user){create(:user)}
  
  scenario "a signed in user can create a post" do
    sign_in(user)

    fill_in "post_content", with: "this is post content"
    expect{click_button "Post"}.to change(Post, :count).by(1)
  end


end