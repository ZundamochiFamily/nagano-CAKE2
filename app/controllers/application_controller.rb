class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope =- current_member
       stored_location_for(resource_or_scope) || root_path
    elsif resource_or_scope == current_admin
       stored_location_for(resource_or_scope) || admin_root_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == current_member
       stored_location_for(resource_or_scope) || root_path
       items_path
    elsif resource_or_scope == current_admin
       stored_location_for(resource_or_scope) || admin_root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :member
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number])
  end

end
