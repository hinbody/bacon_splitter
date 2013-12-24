require 'spec_helper'

feature "Viewing bills" do
  before do
    cable_co = FactoryGirl.create(:account, name: "Cable Co.")

    FactoryGirl.create(:bill,
                       account: cable_co,
                       invoice_number: "1234",
                       current_due: 24.35,
                       due_date: "12/12/2013")

    cell_phone = FactoryGirl.create(:account, name: "Celly Co.")

    FactoryGirl.create(:bill,
                       account: cell_phone,
                       invoice_number: "5678",
                       current_due: 45.90,)
                       #not sure why the below line creates a validation error
                       #due_date: "12/13/2013")

    visit accounts_path
    click_link "Cable Co."
    click_link "2013-12-12"
  end

  scenario "Viewing bills for a particular account" do

    expect(page).to have_content("1234")
    expect(page).to_not have_content("5678")

    within("#bill h2") do
      expect(page).to have_content("1234")
    end
    expect(page).to have_content("24.35")
    expect(page).to have_content("2013-12-12")
  end

  scenario "link back to @account" do

    click_link "Cable Co."
    #not sure what var to use for the route helper below
    #current_path.should == account_path(account)
    within("h2") do
      expect(page).to have_content('Cable Co.')
    end
  end
end
