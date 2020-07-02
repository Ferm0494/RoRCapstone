require 'rails_helper'
RSpec.describe 'Login', type: :feature do
  let(:user) { User.new(name: 'Fernando') }
  scenario 'Valid login' do
    user.save
    visit login_path
    fill_in 'Username', with: user.name
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
  end

  scenario 'Invalid login' do
    visit login_path
    fill_in 'Username', with: user.name
    click_button 'Log in'
    expect(page).not_to have_current_path(root_path)
  end
end
