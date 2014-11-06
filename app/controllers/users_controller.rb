# user controller
class UsersController < ApplicationController
  def new
    
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Thanks for the sympathy.'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = 'problem doing the thing'
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
