class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_devise_params, if: :devise_controller?

  before_action :set_new_game

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :password, :password_confirmation, :current_password) }
  end

  # Болванка новой игры для кнопки "Начать игру", доступной на любой странице сайта
  def set_new_game
    @new_game ||= Game.new
  end
end
