class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
      return
    else
      head(:forbidden)
      redirect_to login_path
      return 
    end
  end
end
