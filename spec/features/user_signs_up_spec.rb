require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
  } do

    scenario 'provide valid registration information' do
      visit new_user_registration_path

      fill_in 'Email', with: 'john@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      fill_in 'First Name', with: 'Dennis'
      fill_in 'Last Name', with: 'Coles'
      fill_in 'Food Truck Name', with: 'Ghost Peppah Killahs'
      fill_in 'Phone Number', with: '9009910304'
      fill_in 'City', with: 'Shaolin'
      fill_in 'State', with: 'NY'
      fill_in 'Website', with: 'www.wutang.com'
      fill_in 'Description', with: 'Ghostface, catch the blast of a hype verse'

      click_button 'Sign up'

      expect(page).to have_content('Your approval is pending review. Look for an email from us shortly.')
      expect(page).to have_content('Sign Out')
    end

    scenario 'provide invalid registration information' do
      visit new_user_registration_path

      click_button 'Sign up'
      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content('Sign Out')
    end
  end
