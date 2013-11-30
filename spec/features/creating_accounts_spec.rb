require 'spec_helper'

feature 'Creating Accounts' do
  before do
    visit accounts_path

    click_link 'New Account'
  end

  scenario "can create an account" do 
    fill_in 'Name', with: 'Cable Co'
    fill_in 'Phone Number', with: '111-111-1111'
    fill_in 'Number', with: '123456789'
    fill_in 'Website', with: 'www.example.com'
    fill_in 'Email', with: 'cable@example.com'
    click_button 'Create Account'

    expect(page).to have_content('Cable Co')
    expect(page).to have_content('111-111-1111')
    expect(page).to have_content('123456789')
    expect(page).to have_content('www.example.com')
    expect(page).to have_content('cable@example.com')

    expect(page).to have_content('This Account has been created.')
  end

  scenario "an account can not be created with no name" do
    click_button 'Create Account'

    expect(page).to have_content("This Account has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
