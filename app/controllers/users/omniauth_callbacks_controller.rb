# encoding: utf-8
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # 想要把 "sessions" 和 "registrations" controller 也拉進來這個資料夾，先放著。
  # 如果放進來不要忘記有個 Users 要加
  def facebook
    auth = request.env["omniauth.auth"]
    # TODO: 這裡 error 要倒到 404 然後吃 flash
    # render :text => "Facebook 認證資訊不合法！" if auth.info.email.nil?
    @user = User.find_for_facebook_oauth(auth, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = auth
      redirect_to new_user_session_url
    end
  end
end