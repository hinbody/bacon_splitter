require 'spec_helper'

feature "Entering Bills" do
  before do
    FactoryGirl.create(:account, name: "Cable Co")

    visit accounts_path
    click_link "Cable Co"
    click_link "New Bill"
  end

  scenario "Entering a bill" do
    fill_in "invoice number", with: "123456"
    fill_in "current amount due", with: "56.98"
    fill_in "date due", with: "12/12/2013"
    click_button "Enter Bill"

    expect(page).to have_content("This bill has been entered.")
  end

  scenario "Entering a bill without valid attributes fails" do
    click_button "Enter Bill"

    expect(page).to have_content("Bill has not been entered.")
    expect(page).to have_content("Current due can't be blank")
    expect(page).to have_content("Due date can't be blank")
  end
end
