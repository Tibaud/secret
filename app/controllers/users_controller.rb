class UsersController < ApplicationController
  skip_before_action :require_valid_user!
  before_action :reset_session

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] =  'Vous avez créé votre compte!'
      redirect_to root_path
    else
      render :new
    end
  end


private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
