class UserMailer < ActionMailer::Base
  default :from => "dailywaiverwire@gmail.com"
 
  def welcome_email(email)
    @email = email
    mail(:to => email.email, :subject => "Welcome to My Awesome Site")
  end
end