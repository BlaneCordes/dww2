class FreeAgentMailer < ActionMailer::Base
  default :from => "dailywaiverwire@gmail.com"
 
  def free_agent_email(user)
    @user = user
    @url  = "www.dailywaiverwire.com"
    mail(:to => user.email, :subject => "Today's Waiver Wire")
  end
end