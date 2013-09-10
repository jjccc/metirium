# encoding: utf-8
class Measurement < ActiveRecord::Base
  belongs_to :dimension
  
  attr_accessor :is_created_from_dashboard, :string_date
  
  validates_presence_of :dimension_id, :message => "La medición debe asociarse a una variable."
  validates_presence_of :string_date, :message => "Se debe indicar una fecha y hora a la medición."
  validates_numericality_of :amount, :message => "La cantidad debe ser un número.", :if => :is_quantified_dimension?
  validate :string_date_is_datetime 
  
  def is_quantified_dimension?
    self.dimension.is_quantified?
  end
  
  def string_date_is_datetime
    d = self.string_date.match(/(?<day>\d{2})\/(?<month>\d{2})\/(?<year>\d{2}) (?<hour>\d{2}):(?<minute>\d{2}):(?<second>\d{2})/)
    begin
      year = (d[:year].to_i + 2000) > DateTime.now.year ? d[:year].to_i + 1900 : d[:year].to_i + 2000
      self.measured_at = DateTime.new(year, d[:month].to_i, d[:day].to_i, d[:hour].to_i, d[:minute].to_i, d[:second].to_i)
    rescue
      errors.add(:string_date, "La fecha y hora que has introducido no eran correctas.")
    end
  end
  
end
