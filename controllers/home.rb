get '/' do
  layout_vars[:page_title]= 'Home'
  erb :'home/index'
end  