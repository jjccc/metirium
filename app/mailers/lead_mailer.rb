class LeadMailer < ActionMailer::Base
  default from: "El equipo de Metirium <no-responder@metirium.com>"
  
  def welcome_mail(lead)
    @digest = lead.digest
    mail(to: lead.email, subject: 'Bienvenido a Metirium.com')
  end
end