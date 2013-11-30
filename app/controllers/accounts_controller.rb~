class AccountsController < ApplicationController
  before_action :set_account, only: [:show,
                                     :edit,
                                     :update,
                                     :destroy]

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
  end

  def edit
  end

  def update
    if @account.update(account_params)
      flash[:notice] = "This Account has been updated."
      redirect_to @account
    else
      flash[:alert] = "This Account has not been updated."
      render "edit"
    end
  end

  def destroy
    @account.destroy

    flash[:notice] = "This Account has been deleted."

    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:name, :number, :website, :email)
  end

  def set_account
    @account = Account.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The account you were looking for could not be found."
    redirect_to accounts_path
  end

end
