class LeadMailer < ActionMailer::Base
  default from: "no-responder@metirium.com"
  
  def welcome_mail(lead)
    mail(to: lead.email, subject: 'Bienvenido a Metirium.com')
  end
end