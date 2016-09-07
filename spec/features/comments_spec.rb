require 'rails_helper'



feature "Commenting" do 

  let(:user){create(:user)}
  

  scenario "a signed in user can comment on a post" do
    post = create(:post, user: user)
    sign_in(user)

    fill_in "comment[content]", with: "this is a comment"
    expect{click_button "Comment"}.to change(Comment, :count).by(1)

  end



end