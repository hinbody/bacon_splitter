require 'spec_helper'
describe AccountsController do 
  it "displays an error for a missing account" do 
    get :show, id: "not_here"
    expect(response).to redirect_to(accounts_path)
    message = "The account you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end
