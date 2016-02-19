module LoginMacros
  def log_in(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end

  def log_out
    visit users_path
    click_link "Logout"
  end
end