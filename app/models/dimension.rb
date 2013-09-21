# encoding: utf-8
class Dimension < ActiveRecord::Base
  belongs_to :fact
  belongs_to :user
  has_many :measurements, :dependent => :destroy
  
  validates_presence_of :name, :message => "La variable debe tener un nombre."
  validates_presence_of :fact_id, :message => "La variable debe ser de algún tipo."
  validates :name, :length => { :maximum => 250, :too_long => "El nombre no puede tener más de %{count} caracteres." }
  
  attr_accessor :return_path
  
  def is_spot?
    self.fact_id == 1
  end
  
  def is_quantified?
    self.fact_id == 2
  end
  
  def measurements_count
    m = self.measurements
    m.blank? ? 0 : m.count
  end
  
  def as_json(options = {})
    {
      id: self.id,
      name: self.name,
      created_at: self.created_at.strftime("%d/%m/%Y"),
      fact: self.fact.name,
      measurements: measurements_count,
      privacity: self.is_public ? "Pública" : "Privada",
      url: options[:url],
      edit_url: options[:edit_url]
    }
  end
  
end
