require 'spec_helper'

feature "Viewing accounts" do
  scenario "Listing all accounts" do
    account = FactoryGirl.create(:account, name: "Cable Co")
    visit accounts_path
    click_link 'Cable Co'
    expect(page.current_url).to eql(account_url(account))
  end
end
