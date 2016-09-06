require 'rails_helper'


describe Like do 

  let(:like){create(:like)}

  it "belongs to a user" do 
    expect{like.user}.to_not raise_error

  end

  



end