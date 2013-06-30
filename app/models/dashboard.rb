# encoding: utf-8
class Dashboard
  
  attr_reader :recent_measurements, :recent_dimensions, :recent_charts, 
              :total_measurements, :total_dimensions, :total_charts
  
  def initialize(user)
    @recent_dimensions = []
    5.times do |i|
      @recent_dimensions << { :name => "Dimensión #{i}" }
    end
    
    @recent_measurements = []
    5.times do |i|
      @recent_measurements << { :name => "Medición #{i}" }
    end
    
    @recent_charts = []
    5.times do |i|
      @recent_charts << { :name => "Estadística #{i}" }
    end
    
    @total_measurements = Measurement.all.count
    @total_dimensions = Dimension.all.count
    @total_charts = 0
  end
  
end
