class StaticPagesController < ApplicationController
  def home
    @user = User.new
    @user.build_profile
  end
end
