ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:user_name => "dailywaiverwire@gmail.com",
	:password => "Mets2012",
	:authentication => "plain",
	:enable_starttls_auto => true
}
