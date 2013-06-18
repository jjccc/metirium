# encoding: utf-8
module DashboardsHelper
  
  def total_measurements_tag(n)
    n == 1 ? "#{n} registro" : "#{n} registros"  
  end
  
  def total_dimensions_tag(n)
    n == 1 ? "#{n} medición" : "#{n} mediciones"
  end
  
  def total_charts_tag(n)
    n == 1 ? "#{n} gráfico" : "#{n} gráficos"
  end
  
end