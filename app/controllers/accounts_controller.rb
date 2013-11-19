class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      flash[:notice] = "This Account has been created."
      redirect_to @account
    else
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  private
  
  def account_params
    params.require(:account).permit(:name, :number, :website, :email)
  end

end
