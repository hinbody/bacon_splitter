require 'spec_helper'

feature "Editing Accounts" do
  before do
    FactoryGirl.create(:account, name: "Cable Co")

    visit accounts_path
    click_link "Cable Co"
    click_link "Edit Account"
  end

  scenario "Updating an account" do
    fill_in "Name", with: "Cable Company"
    click_button "Update Account"

    expect(page).to have_content("This Account has been updated.")
  end

  scenario "Updating an account with invalid attributes is bad" do
    fill_in "Name", with: ""
    click_button "Update Account"

    expect(page).to have_content("This Account has not been updated.")
  end
end
