require 'rails_helper'


feature "Liking" do

  let(:user){create(:user)}
  let(:post){create(:post, user: user)}
  

  scenario "a signed in user can like a post" do
    post = create(:post, user: user)

    sign_in(user)
    expect{click_link "Like"}.to change(Like, :count).by(1)


  end



  # scenario "a signed in user can like a comment" do
  #   comment = create(:comment, user: user)
    
  #   click_link "Like"
  #   #how to select the second like link since two on page
  # end





end