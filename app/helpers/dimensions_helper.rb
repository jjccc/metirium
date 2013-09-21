# encoding: utf-8
module DimensionsHelper
  
  def text_measurements(n)
    n == 1 ? "medición" : "mediciones"
  end
  
  def active_fact_class(fact, dimension)    
    fact_class = ""
    if dimension.new_record?
      fact_class = "active" if fact.id == 1 
    else
      fact_class = "active" if fact.id == dimension.fact_id 
    end
    fact_class
  end
  
  def active_is_public_class(is_public, dimension)    
    is_public_class = ""
    if dimension.new_record?
      is_public_class = "active" if is_public == false 
    else
      is_public_class = "active" if is_public == dimension.is_public
    end
    is_public_class
  end
  
  def privacity(is_public)
    is_public ? "Pública" : "Personal"
  end
  
  def privacity_button_text(is_public)
    is_public ? "Hacer privada" : "Hacer pública"
  end

end 