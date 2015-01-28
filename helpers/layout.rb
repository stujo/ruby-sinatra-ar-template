require 'rack/utils'

helpers do
  def layout_vars
    @layout_vars ||= Hash.new
  end  
  def layout_head_title
    return 'Sinatra HTML5 Template App' if layout_vars[:page_title].blank?
    "#{layout_vars[:page_title]} | Sinatra HTML5 Template App"
  end  
end