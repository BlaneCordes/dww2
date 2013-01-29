class InjuryAlert < ActionMailer::Base
  default :from => "dailywaiverwire@gmail.com"
 
  def send_injury_alert(user_id)
    user = User.find(user_id)
    url  = "www.dailywaiverwire.com"
    mail(:to => user.email, :subject => "You have an injury alert !!", :from => "dailywaiverwire@gmail.com")
  end
end
