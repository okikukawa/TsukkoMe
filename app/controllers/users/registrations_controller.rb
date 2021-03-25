class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only:[:edit, :update]

  def check_guest
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user), alert: "ゲストユーザーでマイページの編集を行うことはできません。"
    end
  end
end
