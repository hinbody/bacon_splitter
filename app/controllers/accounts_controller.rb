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
      flash[:alert] = "This Account has not been created."

      render "new"
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    @account.update(account_params)

    flash[:notice] = "This Account has been updated."
    redirect_to @account
  end

  private
  
  def account_params
    params.require(:account).permit(:name, :number, :website, :email)
  end

end