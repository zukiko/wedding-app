class ApplicationController < ActionController::Base
  before_action :config_permited_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    receptions_path
  end

  private
  def config_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:attendance, :bride_groom, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture_code, :city, :address, :building, :allergy, :bus])
  end
end
