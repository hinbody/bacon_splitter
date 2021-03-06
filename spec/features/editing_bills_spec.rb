require 'spec_helper'

feature "Editing bills" do
  let!(:account) { FactoryGirl.create(:account) }
  let!(:bill) { FactoryGirl.create(:bill, account: account) }

  before do
    visit accounts_path
    click_link account.name
    click_link bill.due_date
    click_link "Edit Bill"
  end

  scenario "Updating a bill" do
    fill_in "invoice number", with: "5678"
    click_button "Enter Bill"

    expect(page).to have_content "Bill has been updated."

    within("#bill h2") do
      expect(page).to have_content("5678")
    end

    expect(page).to_not have_content bill.invoice_number
  end

  scenario "Updating a bill with invalid information" do
    fill_in "current amount due", with: ""
    click_button "Enter Bill"

    expect(page).to have_content("Bill has not been updated.")
  end
end
