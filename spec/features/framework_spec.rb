require 'rails_helper'
RSpec.describe "Framework validations" , type: :feature do
        scenario 'A user can create a valid framework if name/icon not blank or duped' do
            User.create(name: 'Foobar')
            visit login_path
            fill_in 'Username', with: 'Foobar'
            click_button 'Log in'
            visit framework_new_path(:other)
            fill_in 'Name', with: "CSS"
            image_path = Rails.root + 'app/assets/images/other.png'
            attach_file image_path
            click_button 'Create new framework'
            expect(page).to have_content("Total Frameworks: 1")

        end

        scenario 'A user cant create a valid framework if name is blank' do
            User.create(name: 'Foobar')
            visit login_path
            fill_in 'Username', with: 'Foobar'
            click_button 'Log in'
            visit framework_new_path(:other)
            fill_in 'Name', with: ""
            image_path = Rails.root + 'app/assets/images/other.png'
            attach_file image_path
            click_button 'Create new framework'
            expect(page).to have_current_path(framework_new_path(1))

        end

        scenario 'A user cant create a valid framework if icon is blank' do
            User.create(name: 'Foobar')
            visit login_path
            fill_in 'Username', with: 'Foobar'
            click_button 'Log in'
            visit framework_new_path(:other)
            fill_in 'Name', with: "SASS"
            click_button 'Create new framework'
            expect(page).to have_current_path(framework_new_path(1))

        end
        
        
end