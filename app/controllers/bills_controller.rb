class BillsController < ApplicationController
  before_action :set_account
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def new
    @bill = @account.bills.build
  end

  def create
    @bill = @account.bills.build(bill_params)
    if @bill.save
      flash[:notice] = "This bill has been entered."
      redirect_to [@account, @bill]
    else
      flash[:alert] = "Bill has not been entered."
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bill.update(bill_params)
      flash[:notice] = "Bill has been updated."

      redirect_to [@account, @bill]
    else
      flash[:alert] = "Bill has not been updated."

      render action: "edit"
    end
  end

  def destroy
    @bill.destroy
    flash[:notice] = "Bill has been deleted."

    redirect_to @account
  end

  private
  def bill_params
    params.require(:bill).permit(:invoice_number, :current_due, :due_date)
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_bill
    @bill = @account.bills.find(params[:id])
  end
end
