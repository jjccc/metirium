# encoding: utf-8
class Dashboard
  
  attr_reader :recent_measurements, :recent_dimensions
  
  def initialize
    @recent_dimensions = []
    5.times do |i|
      @recent_dimensions << { :name => "Dimensión #{i}" }
    end
    
    @recent_measurements = []
    5.times do |i|
      @recent_measurements << { :name => "Medición #{i}" }
    end
  end
  
end
