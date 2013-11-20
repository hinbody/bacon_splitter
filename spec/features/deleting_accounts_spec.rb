require 'spec_helper'

feature "Deleting accounts" do
  scenario "Deleting an account" do
    FactoryGirl.create(:account, name: "Cable Co")

    visit accounts_path
    click_link "Cable Co"
    click_link "Delete Account"

    expect(page).to have_content("This Account has been deleted.")

    visit accounts_path

    expect(page).to have_no_content("Cable Co")
  end
end
