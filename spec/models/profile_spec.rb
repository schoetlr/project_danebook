require 'rails_helper'


describe Profile do 

  let(:profile) {create(:profile)}

  it "is valid with a first and last name" do 
    expect(profile).to be_valid

  end


  it "is invalid without a first or last name" do 
    profile = build(:profile, first_name: nil, last_name: nil)
    expect(profile).to_not be_valid

  end






end