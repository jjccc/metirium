# encoding: utf-8
class Measurement < ActiveRecord::Base
  belongs_to :dimension
  
  validates_presence_of :dimension_id, :message => "La medición debe asociarse a una variable."
  validates_numericality_of :amount, :message => "La cantidad debe ser un número.", :if => :is_quantified_dimension?
  
  def is_quantified_dimension?
    self.dimension.is_quantified?
  end
end
