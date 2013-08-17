# encoding: utf-8
class Dimension < ActiveRecord::Base
  belongs_to :fact
  belongs_to :user
  has_many :measurements
  
  validates_presence_of :name, :message => "La variable debe tener un nombre."
  validates_presence_of :fact_id, :message => "La variable debe ser de algún tipo."
  validates :name, :length => { :maximum => 250, :too_long => "El nombre no puede tener más de %{count} caracteres." }
end
