class ApplicationController < ActionController::Base
  before_action :config_permited_parameters, if: :devise_controller?

  private
  def config_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:attendance, :bride_groom, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture_code, :city, :address, :building, :allergy, :bus])
  end
end
