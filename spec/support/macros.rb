module Macros
  def sign_in(user)
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"
  end

  def sign_out

  end


end