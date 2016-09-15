require 'rails_helper'

RSpec.describe NewsfeedController, type: :controller do

  describe "GET #newsfeed" do
    it "returns http success" do
      get :newsfeed
      expect(response).to have_http_status(:success)
    end
  end

end
