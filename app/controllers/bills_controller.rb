class BillsController < ApplicationController
  before_action :set_account

  def new
    @bill = @account.bills.build
  end

  private
  def set_account
    @account = Account.find(params[:account_id])
  end
end
