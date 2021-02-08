class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end

  def ensure_current_user_and_situation
    if user_signed_in?
      unless current_user.id == @situation.user_id
        flash[:notice] = "権限がありません。"
        redirect_to situations_path
      end
    else
      redirect_to new_user_registration_path, notice:"ログインが必要です"
    end
  end
  def ensure_current_user_and_tsukkomi
    if user_signed_in?
      unless current_user.id == @tsukkomi.user_id
        flash[:notice] = "権限がありません。"
        redirect_to situations_path
      end
    else
      redirect_to new_user_registration_path, notice:"ログインが必要です"
    end
  end
end
