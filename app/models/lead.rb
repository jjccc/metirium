# encoding: utf-8
require 'rubygems'
require 'ValidateEmail'

class Lead < ActiveRecord::Base
  validates_presence_of :name, :message => "El nombre no puede estar vacío" 
  validates_presence_of :email, :message => "El correo electrónico no puede estar vacío"
  validates :name, :length => { :maximum => 150, :too_long => "El nombre no puede tener más de %{count} caracteres" }
  validates :email, :length => { :maximum => 250, :too_long => "El correo electrónico no puede tener más de %{count} caracteres" }
  validate :mail_cannot_be_wrong, :on => :create
  
  def mail_cannot_be_wrong
    if !ValidateEmail.validate(self.email.strip, true)
      errors.add(:email, "La dirección especificada no es una dirección de correo válida")
    end
  end 
end
