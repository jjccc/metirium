# encoding: utf-8
class Heatmap
  
  def initialize(dimension, measurements)
    @dimension = dimension
    @measurements = measurements
  end
  
  def prepare_data
    data = {}
    @measurements.find_each{ |m| data[m.created_at.to_i.to_s] = 1 }
    data
  end
  
end