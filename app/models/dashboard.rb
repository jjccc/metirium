# encoding: utf-8
class Dashboard
  
  attr_reader :recent_measurements, :recent_dimensions, :recent_charts
  
  def initialize
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
  end
  
end
