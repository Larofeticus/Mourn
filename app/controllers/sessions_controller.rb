# sessions controller class
class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = 'you log in good'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = 'you try log in but problem'
      redirect_to log_in_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'stopped being logged in'
    redirect_to root_path
  end
end
