class Highchart
  
  def initialize(measurements)
    @measurements = measurements.sort { |a, b| a.measured_at <=> b.measured_at }
  end
  
  def data
    @measurements
  end
  
  def start_at
    @measurements.map(&:measured_at).min
  end
  
  def min
    #sample_min = @measurements.map(&:amount).min
    #sample_min = sample_min * 0.9 unless sample_min == 0         
    #sample_min
    0
  end
  
end