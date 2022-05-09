class ApplicationController < ActionController::Base
  before_action :config_permited_parameters, if: :devise_controller?
  before_action :basic_auth

  # ログイン後に遷移するpath
  def after_sign_in_path_for(_resource)
    receptions_path
  end

  # ログアウト後に遷移するpath
  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def config_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:attendance, :bride_groom, :name, :name_kana, :postal_code, :prefecture_code, :city,
                                             :address, :building, :allergy, :bus])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
