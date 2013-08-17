module ApplicationHelper
  
  def link_to_twitter
    link_to "Seguir a @metirium", "https://twitter.com/metirium", :class => "twitter-follow-button", :"data-show-count" => "false", :"data-lang" => "es", :rel => "nofollow" 
  end
  
  def has_error_class(errors, symbol)
    errors.any? && errors.keys.any?{ |x| x == symbol } ? "has-error" : ""
  end
   
end
