class Highchart
  
  def initialize(measurements)
    @measurements = measurements.sort { |a, b| a.created_at <=> b.created_at }
  end
  
  def data
    @measurements
  end
  
  def min
    #sample_min = @measurements.map(&:amount).min
    #sample_min = sample_min * 0.9 unless sample_min == 0         
    #sample_min
    0
  end
  
end