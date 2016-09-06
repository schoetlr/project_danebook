require 'rails_helper'


describe Post do 
  
  let(:post){build(:post)}
  let(:user){create(:user)}
 
  it "must have content" do 
    post = build(:post, content: nil)
    expect(post).to_not be_valid
  end

  it "is valid with content" do 
    expect(post).to be_valid
  end

  it "belongs to a user" do 
    expect{post.user}.to_not raise_error
  end

  it "has many likes" do 
    expect{post.likes}.to_not raise_error
  end

  it "has many comments" do 
    expect{post.comments}.to_not raise_error
  end

  describe "#liked_by_user?" do

    it "returns false if a user has not liked a post" do 
      expect(post.liked_by_user?(user)).to be_falsey
    end
    
    
    it "returns true if a user has liked a post" do
      like = Like.create(likeable_type: "Post", 
                likeable_id: post.id,
                user_id: user.id)
      post.likes << like

      expect(post.liked_by_user?(user)).to be true
    end

  end



end