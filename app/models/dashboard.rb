# encoding: utf-8
class Dashboard
  
  attr_reader :dimensions, :measurements, :charts, :events
  
  def initialize(user)        
    @dimensions = 0
    @measurements = 0
    @charts = 0
    @events = []
   
    unless user.nil?
      current_dimensions = user.dimensions.order("created_at desc")
      @dimensions = current_dimensions.count
      current_measurements = Measurement.where(:dimension_id => current_dimensions.map(&:id)).order("created_at desc")
      @measurements = current_measurements.count       
      
      # Mezclamos y ordenamos variables y medidas para devolver las más recientes.
      total_events = []
      current_dimensions.each do |d|
        total_events << [d.id, d.created_at, d]
      end
      current_measurements.each do |m|
        total_events << [m.id, m.created_at, m]
      end
      
      unless total_events.blank?
        total_events.sort!{ |x, y| y[1] <=> x[1] }
        @events = total_events[0..9].map{ |x| x[2] }
      end
    end
  end

end
