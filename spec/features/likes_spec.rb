require 'rails_helper'


feature "Liking" do

  let(:user){create(:user)}
  let(:post){create(:post, user: user)}
  

  scenario "a signed in user can like a post" do
    post = create(:post, user: user)

    sign_in(user)
    expect{click_link "Like"}.to change(post.likes, :count).by(1)


  end



  # scenario "a signed in user can like a comment" do
  #    post = create(:post, user: user)
  #   comment = create(:comment, user: user, post: post)
    
  #   expect{click_link "Like"}.to change(comment.likes, :count).by(1)
  #   #how to select the second like link since two on page
  # end





end