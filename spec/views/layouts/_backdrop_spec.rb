require 'rails_helper'


describe "layouts/_backdrop.html.erb" do 
  let(:user){create(:user)}


  context "The proper link is active:" do 

    def signed_in_user?
      true
    end

    def current_user
      user
    end

    specify "Timeline is active when on the user_posts_path" do 
      render template: "posts/index.html.erb", layout: 'layouts/application', locals: {:@user => user}
             
      expect(rendered).to have_link("Timeline", class: "active")
    end

    specify "About is active when on user_show_path" do 
      render template: "users/show.html.erb", layout: 'layouts/application', locals: { :@user => user }
      
      expect(rendered).to have_link("About", class: "active")

    end



  end





end