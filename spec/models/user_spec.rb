require 'rails_helper'


describe User do 

  let(:user) {create(:user)}
  let(:another_user) {build(:user, email: user.email)}
  let(:profile) {create(:profile)}

  it "is valid with a unique email" do 
    expect(user).to be_valid
  end

  it "is invalid with a duplicate email" do 
    expect(another_user).to_not be_valid
  end

  it "must have an email" do 
    emailless = build(:user, email: nil)
    expect(emailless).to_not be_valid
  end

  it "has a profile" do 
    expect{user.profile}.to_not raise_error
  end


  it "is invalid with a password less than 6 characters" do 
    user = build(:user, password: "1", password_confirmation: "1")
    expect(user).to_not be_valid
  end

  it "has many posts" do 
    expect{user.posts}.to_not raise_error
  end

  it "has many likes" do 
    expect{user.likes}.to_not raise_error
  end






end