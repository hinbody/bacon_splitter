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
    expect(page).to have_content("Your average monthly bill is 30.00")
  end

  scenario "account#show should show average weekly bill if bill.count > 12" do
    #not sure the best way to do this... create 12 bills here?
  end
end
