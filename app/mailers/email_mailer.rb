class EmailMailer < ActionMailer::Base
  default from: "El equipo de Metirium <no-responder@metirium.com>"
  
  def post_mail(email)  
    @email = email
    mail(to: email.addresses, subject: email.subject)
  end
end