require 'rails_helper'
RSpec.describe 'Language create/feature' do
  scenario 'A user can create a language if its logged in and lang name/icon not blank' do
    User.create(name: 'Foobar')
    visit login_path
    fill_in 'Username', with: 'Foobar'
    click_button 'Log in'
    visit languages_new_path
    fill_in 'Name', with: 'Python'
    image_path = Rails.root + 'app/assets/images/other.png'
    attach_file image_path
    click_button 'Create new language'
    expect(page).to have_content('Python')
  end
  scenario 'A user cant create a langauge if its not logged in' do
    visit languages_new_path
    expect(page).to have_current_path(login_path)
  end

  scenario 'A user cant create a language if name blank' do
    User.create(name: 'Foobar')
    visit login_path
    fill_in 'Username', with: 'Foobar'
    click_button 'Log in'
    visit languages_new_path
    fill_in 'Name', with: ''
    image_path = Rails.root + 'app/assets/images/other.png'
    attach_file image_path
    click_button 'Create new language'
    expect(page).to have_current_path(languages_new_path)
  end

  scenario 'A user cant create a language if icon is blank ' do
    User.create(name: 'Foobar')
    visit login_path
    fill_in 'Username', with: 'Foobar'
    click_button 'Log in'
    visit languages_new_path
    fill_in 'Name', with: 'Python'
    click_button 'Create new language'
    expect(page).to have_current_path(languages_new_path)
  end

  scenario 'A user cant create a duped language' do
    language = Language.new(name: 'Python')
    language.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'other.png')),
                         filename: 'other.png',
                         content_type: 'image/other.png')
    language.save
    User.create(name: 'Foobar')
    visit login_path
    fill_in 'Username', with: 'Foobar'
    click_button 'Log in'
    visit languages_new_path
    fill_in 'Name', with: ''
    image_path = Rails.root + 'app/assets/images/other.png'
    attach_file image_path
    click_button 'Create new language'
    expect(page).to have_current_path(languages_new_path)
  end
end
