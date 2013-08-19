# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
    
  has_many :dimensions
  
  # La contraseña debe tener como mínimo un dígito para ser válida
  validate :password_must_contain_digits, :on => :create
  
  def password_must_contain_digits
    errors.add(:password, "La contraseña debe contener al menos un dígito para que sea segura.") if !self.password.blank? && /[0-9]/.match(self.password).blank?   
  end
  
end
