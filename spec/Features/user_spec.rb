require 'rails_helper'

feature 'signing-up' do

  scenario 'visitor is able to sign up' do
    visit root_path

    within('#new_user') do
      fill_in('First name', :with => 'Foo')
      fill_in('Last name', :with => 'Bar')
      fill_in('Email', :with => 'foo@bar.com')
      fill_in('Password', :with => 'foobar123')
      fill_in('Password confirmation', :with => 'foobar123')

      find('#user_birthday_2i').click
      find('#user_birthday_3i').click
      find('#user_birthday_1i').click
      
      find("#user_gender_female").set(true)
      click_on('Sign Up')
    end
      expect(page).to have_content('User was successfully created.')
  end
end

feature 'login' do

   let(:user) { create(:user) }

  scenario 'visitor is able to login' do
    user
    visit root_path

    #within(:css, '')
    fill_in('Email', :with => 'foo@bar.com')
    fill_in('Password', :with => 'foobar123')
    click_on('Sign Up')

    expect(page).to have_content('You have successfully signed in.')

  end
end

feature 'logout' do
  let(:user){ create(:user) }

  scenario 'logged in user can log out' do
    user
    log_in(user)

    expect(page).to have_link('Logout', href: session_path)

    click_link('Logout')

    expect(page).to have_link('Login', href: new_session_path)
  end
end

