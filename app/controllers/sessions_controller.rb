# encoding: utf-8
class SessionsController < Devise::SessionsController
  def new
    if request.env['HTTP_REFERER'] && request.env['HTTP_REFERER'].include?(Settings.dns_name) && request.env['HTTP_REFERER'] != "#{Settings.dns_name}/users/login"
      session[:return_to] = request.env['HTTP_REFERER']
    end
  end

  def create
    if request.env['HTTP_REFERER'] && request.env['HTTP_REFERER'].include?(Settings.dns_name) && request.env['HTTP_REFERER'] != "#{Settings.dns_name}/users/login"
      session[:return_to] = request.env['HTTP_REFERER']
    end

    super
  end

  def destory
    session[:cart_id] = nil
  end
end
