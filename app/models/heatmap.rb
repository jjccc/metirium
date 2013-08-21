# encoding: utf-8
class Heatmap
  
  def initialize(measurements)
    @measurements = measurements
  end
  
  def data
    data = {}
    @measurements.find_each{ |m| data[m.created_at.to_i.to_s] = 1 }
    data
  end
  
end