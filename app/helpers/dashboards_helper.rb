# encoding: utf-8
module DashboardsHelper

  def text_dimensions(n)
    n == 1 ? "variable" : "variables"
  end
  
  def text_measurements(n)
    n == 1 ? "medición" : "mediciones"
  end
  
  def text_charts(n)
    n == 1 ? "gráfico" : "gráficos"
  end 
   
  def event_url_for(e)
    e.class == Dimension ? user_dimension_url(current_user, e) : user_dimension_measurement_url(current_user, e.dimension_id, e)
  end
  
  def event_text(e)
    if e.class == Dimension
      "Se crea la variable <a href='#{event_url_for(e)}'>#{e.name}</a>.".html_safe
    else
      "Se realiza una medición de la variable <a href='#{event_url_for(e.dimension)}'>#{e.dimension.name}</a>.".html_safe
    end
  end
  
end