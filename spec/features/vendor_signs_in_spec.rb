require 'rails_helper'

feature 'approved vendor signs in' do
  scenario 'visit index page' do
    vendor = User.create!(email: 'vendor@vendor.com', status: nil,
                          role: 'vendor', first_name: 'Robert',
                          last_name: 'Haynes', phone_number: '8287197689',
                          city: 'Philadelphia', state: 'PA',
                          food_truck_name: 'Foodie', url: 'www.google.com',
                          description: 'check me out', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: vendor.email
    fill_in 'Password', with: vendor.password
    click_button 'Log in'
    visit '/'

    expect(page).to have_content('Vendor Profile')
  end

  scenario 'vendor visits their profile' do
    vendor = User.create!(email: 'vendor@vendor.com', status: nil,
                          role: 'vendor', first_name: 'Robert',
                          last_name: 'Haynes', phone_number: '8287197689',
                          city: 'Philadelphia', state: 'PA',
                          food_truck_name: 'Foodie', url: 'www.google.com',
                          description: 'check me out', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: vendor.email
    fill_in 'Password', with: vendor.password
    click_button 'Log in'
    visit user_path(vendor)

    expect(page).to have_content(vendor.food_truck_name)
    expect(page).to have_content(vendor.email)
    expect(page).to have_content('Location')
  end
end
