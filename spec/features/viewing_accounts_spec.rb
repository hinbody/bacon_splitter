require 'spec_helper'

feature "Viewing accounts" do
    let!(:account) { FactoryGirl.create(:account, name: "Cable Co") }
    let!(:bill) { FactoryGirl.create(:bill, account: account,
                                    current_due: 20) }
    let!(:bill1) { FactoryGirl.create(:bill, account: account,
                                    current_due: 40) }

    before do
    visit accounts_path
    click_link 'Cable Co'
    end

  scenario "Listing all accounts" do
    expect(page.current_url).to eql(account_url(account))
  end

  scenario "account#show should show the average monthly bill" do
    expect(page).to have_content("Your average bill is 30.00")
  end
end
