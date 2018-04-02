require 'rails_helper'

feature 'admin signs in' do
  scenario 'visit admin section' do
    admin = User.create!(email: 'Admin@vendor.com', status: nil,
                         role: 'admin', first_name: 'Robert',
                         last_name: 'Haynes', phone_number: '8287197689',
                         city: 'Philadelphia', state: 'PA',
                         food_truck_name: 'Admin', url: 'www.google.com',
                         description: 'check me out', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit '/users'

    expect(page).to have_content('Active Users List')
  end
end
