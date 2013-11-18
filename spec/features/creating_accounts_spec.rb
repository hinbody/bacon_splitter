require 'spec_helper'

feature 'Creating Accounts' do
  scenario "can create an account" do 
    visit accounts_path

    click_link 'New Account'

    fill_in 'Name', with: 'Cable Co'
    fill_in 'Number', with: '123456789'
    fill_in 'Website', with: 'www.example.com'
    fill_in 'Email', with: 'cable@example.com'
    click_button 'Create Account'

    expect(page).to have_content('This Account has been created.')
  end
end
