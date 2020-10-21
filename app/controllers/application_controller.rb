class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_up_path_for(resource)
    member_path
  end

  def after_sign_in_path_for(resource)
    member_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number])
  end

end
