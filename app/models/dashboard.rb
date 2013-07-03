# encoding: utf-8
class Dashboard
  
  attr_reader :recent_measurements, :recent_dimensions, :recent_charts, 
              :total_measurements, :total_dimensions, :total_charts,
              :has_dimensions_paginator, :has_measurements_paginator, :has_charts_paginator
  
  def initialize(user)        
    @total_dimensions = 0
    @total_dimensions = 0
    @total_charts = 0
    @recent_dimensions = []
    @recent_measurements = []
    @recent_charts = []
    
    6.times do |i|
      @recent_charts << { :name => "Estadística #{i}" }
    end
   
    unless user.nil?
      dimensions = user.dimensions
      measurements = Measurement.where(:dimension_id => dimensions.map(&:id)) 
      @recent_dimensions = dimensions.order("created_at desc").limit(5)
      @recent_measurements = measurements.limit(5)
      
      @total_measurements = measurements.count
      @total_dimensions = dimensions.count
      @total_charts = @recent_charts.count
    end
  end
  
  def has_dimensions_paginator
    @total_dimensions > 5
  end
  
  def has_measurements_paginator
    @total_measurements > 5
  end
  
  def has_charts_paginator
    @total_charts > 5
  end
  
end
