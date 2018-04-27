require 'rails_helper'

feature 'admin signs in' do
  scenario 'visit user show page for unapproved vendor' do
    admin = User.create!(email: 'Admin33@vendor.com', status: nil,
                         role: 'admin', first_name: 'Robert',
                         last_name: 'Haynes', phone_number: '8287197689',
                         city: 'Philadelphia', state: 'PA',
                         food_truck_name: 'Admin', url: 'www.google.com',
                         description: 'check me out', password: 'password')
    vendor = User.create!(email: 'vendor33@vendor.com', status: nil,
                          role: 'user', first_name: 'Robert',
                          last_name: 'Haynes', phone_number: '8287197689',
                          city: 'Philadelphia', state: 'PA',
                          food_truck_name: 'Foodie', url: 'www.google.com',
                          description: 'check me out', password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit user_path(vendor)

    expect(page).to have_content('Foodie')
    expect(page).to have_content(vendor.email)
    expect(page).to have_content(vendor.food_truck_name)
    expect(page).to have_css('input')
  end
  scenario 'visit user show page for approved vendor' do
    admin = User.create!(email: 'Admin55@vendor.com', status: nil,
                         role: 'admin', first_name: 'Robert',
                         last_name: 'Haynes', phone_number: '8287197689',
                         city: 'Philadelphia', state: 'PA',
                         food_truck_name: 'Admin', url: 'www.google.com',
                         description: 'check me out', password: 'password')
    vendor = User.create!(email: 'vendor25@vendor.com', status: nil,
                          role: 'vendor', first_name: 'Robert',
                          last_name: 'Haynes', phone_number: '8287197689',
                          city: 'Philadelphia', state: 'PA',
                          food_truck_name: 'Foodie', url: 'www.google.com',
                          description: 'check me out', password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    visit user_path(vendor)

    expect(page).to have_content('Foodie')
    expect(page).to have_content(vendor.email)
    expect(page).to have_content(vendor.food_truck_name)
    expect(page).to have_css('input')
  end
end
