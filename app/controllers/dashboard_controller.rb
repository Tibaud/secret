class DashboardController < ApplicationController
  before_action :require_valid_user!
  def show

    def current_user
      if !session[:user_id].blank?
        @user ||= User.find(session[:user_id])
        flash[:success] = 'Tu es bien connecté!'
      end
    end
    # si user=nil, on redirige vers la page de login
    def require_valid_user!
      if current_user.nil?
        flash[:error] = 'Vous devez être connecté pour connaitre le secret de l\'univers!'
        redirect_to login_path
      end
    end
  end
end
