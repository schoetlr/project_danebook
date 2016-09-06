require 'rails_helper'



describe Comment do 

  let(:comment){create(:comment)}
  it "belongs to user" do 
    expect{comment.user}.to_not raise_error
  end

  it "has many likes" do 
    expect{comment.likes}.to_not raise_error
  end

  it "is invalid without content" do 
    comment = build(:comment, content: nil)
    expect(comment).to_not be_valid
  end

  it "is valid with content" do 
    expect(comment).to be_valid
  end

end