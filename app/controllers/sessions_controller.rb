class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.where(:name => params[:signin][:name]).first

    if user && user.authenticate(params[:signin][:password])

      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}"

      redirect_to root_url
    else
      flash[:error] = "Sorry, please sign in again."
      render :new
    end
  end
end
