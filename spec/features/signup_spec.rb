require 'rails_helper'
RSpec.describe 'Signup feature', type: :feature do
  scenario 'User can create a new account if username/name not blank or taken' do
    visit signup_path
    fill_in 'Username', with: 'John_doe'
    click_button 'Create an account'
    expect(page).to have_current_path(root_path)
  end

  scenario 'User cant create a new account if username is blank' do
    visit signup_path
    fill_in 'Username', with: ''
    click_button 'Create an account'
    expect(page).to have_current_path(signup_path)
  end

  scenario 'User cant create a new account if username is already taken' do
    User.create(name: 'Foobar')
    visit signup_path
    fill_in 'Username', with: 'Foobar'
    click_button 'Create an account'

    expect(page).to have_current_path(signup_path)
  end
end
