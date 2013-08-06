module ApplicationHelper
  
  def link_to_twitter
    link_to "Seguir a @metirium", "https://twitter.com/metirium", :class => "twitter-follow-button", :"data-show-count" => "false", :"data-lang" => "es", :rel => "nofollow" 
  end
   
end
