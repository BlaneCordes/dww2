class UserMailer < ActionMailer::Base
  default :from => "dailywaiverwire@gmail.com"
 
  def welcome_email(user)
    @user = user
    @url  = "www.dailywaiverwire.com"
    mail(:to => user.email, :subject => "Wecome to the Daily Waiver Wire")
  end
end