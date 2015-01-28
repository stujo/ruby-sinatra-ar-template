helpers do

  def auth_login_user hash
    p hash
  end  

  def auth_authenticated?
    !session[:auth_user_id].blank?
  end

  def auth_logout!
    session.delete :auth_user_id
  end

  def auth_authenticate!
    return if auth_authenticated?
    auth_set_redirect_url
    redirect '/login'
  end

  def auth_save_login_redirect_url
    session.delete :auth_login_redirect_url
    if request.get? && request.query_string.blank?
      session[:auth_login_redirect_url] = request.path
    end
  end

  def auth_do_login_redirect!
    redirect session[:auth_login_redirect_url] unless session[:auth_login_redirect_url].blank?
    redirect '/'
  end

  def auth_do_logout_redirect!
    redirect '/'
  end

end
