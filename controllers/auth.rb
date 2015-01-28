get '/login' do
  layout_vars[:page_title]= 'Login'
  erb :'auth/login'
end  

post '/login' do
  layout_vars[:page_title]= 'Login'
  auth_login_user(params[:login])
  if auth_authenticated?
    auth_do_login_redirect!
  else
    erb :'auth/login'
  end  
end  

get '/logout' do
  auth_logout!
  auth_do_logout_redirect!
end
