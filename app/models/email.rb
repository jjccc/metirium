# encoding: utf-8
class Email
  # Estas tres líneas son necesarias porque el modelo Email no deriva de ActiveRecord
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :addresses, :subject, :body, :want_copy, :user_id, :is_contact, :from, :prefix
    
  validates_presence_of :addresses, :message => :is_contact? ? "Escribe tu dirección de correo electrónico" : "Al menos debe haber un destinatario."
  validates_presence_of :subject, :message => "Debes definir un asunto para el correo."
  
  def initialize(options = {})
    unless options.blank?
      user = User.find(options[user_id]) unless options[user_id].blank?
      self.is_contact = options[:is_contact] == "true"
      self.from = user.nil? ? options[:addresses] : user.email
      self.addresses = options[:addresses].split(",")
      self.subject = options[:subject]
      self.body = options[:body]      
      self.valid?
      self.addresses = ["contacto@metirium.com"] if self.is_contact
      self.addresses << self.from if options[:want_copy].present? && options[:want_copy] == true
      self.prefix = self.is_contact ? "contact-" : ""                      
    end    
  end
  
  def persisted?
    false
  end
      
end