module ApplicationHelper
  
  def link_to_twitter
    link_to "Seguir a @metirium", "https://twitter.com/metirium", :class => "twitter-follow-button", :"data-show-count" => "false", :"data-lang" => "es" 
  end
  
  def current_controller?( controller )
    ActionController::Routing::Routes.recognize_path(request.fullpath)[:controller] == controller
  end
   
end
