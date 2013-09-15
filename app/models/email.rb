class Email
  # Estas tres líneas son necesarias porque el modelo Email no deriva de ActiveRecord
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :addresses, :subject, :body, :want_copy, :user_id
    
  validates_presence_of :addresses, :message => "Al menos debe haber un destinatario."
  validates_presence_of :subject, :message => "Debes definir un asunto para el correo."
  
  def initialize(options = {})
    unless options.blank?
      self.addresses = options[:addresses].split(",")
      self.subject = options[:subject]
      self.body = options[:body]
      self.valid?
      self.addresses << User.find(options[user_id]).email if options[:want_copy].present? && options[:want_copy] == true      
    end    
  end
  
  def persisted?
    false
  end
      
end