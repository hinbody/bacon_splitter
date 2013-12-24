require 'spec_helper'

feature 'Deleting bills' do
  let!(:account) { FactoryGirl.create(:account) }
  let!(:bill) { FactoryGirl.create(:bill, account: account) }

  before do
    visit accounts_path
    click_link account.name
    click_link bill.due_date
  end

  scenario "Deleting a bill" do
    click_link "Delete Bill"

    expect(page).to have_content("Bill has been deleted.")
    expect(page.current_url).to eq(account_url(account))
  end
end
