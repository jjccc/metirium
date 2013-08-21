class Highchart
  
  def initialize(measurements)
    @measurements = measurements.sort { |a, b| a.created_at <=> b.created_at }
  end
  
  def data    
    @measurements
  end
  
  def min
    @measurements.map(&:amount).min
  end
  
end