class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # on check si le user est valide
  before_action :require_valid_user!

  def current_user
    if !session[:user_id].blank?
      @user ||= User.find(session[:user_id])
    end
  end
  # si user=nil, on redirige vers la page de login
  def require_valid_user!
    if current_user.nil?
      flash[:error] = 'Vous devez être connecté pour accéder au secret!'
      redirect_to login_path
    end
  end
end
