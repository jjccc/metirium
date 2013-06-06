# encoding: utf-8
class Lead < ActiveRecord::Base
  validates_presence_of :name, :message => "El nombre no puede estar vacío" 
  validates_presence_of :email, :message => "El correo electrónico no puede estar vacío"
  validates :name, :length => { :maximum => 150, :too_long => "El nombre no puede tener más de %{count} caracteres" }
  validates :email, :length => { :maximum => 250, :too_long => "El correo electrónico no puede tener más de %{count} caracteres" }
end
