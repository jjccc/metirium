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
  
end 