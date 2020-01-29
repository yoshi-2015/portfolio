class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    # ユーザ登録（sign_up）の際に、データ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nickname])
    # ログイン登録（sign_in）の際に、データ操作を許可
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end
  # ログイン後にマイページに遷移する
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
