Feature: player feed of real-time updates and news

	As a fantasy team management application
	I want to receive constant news and updates about players
	So that I can analyze them and provide value to my users

	Scenario: rotoworld player update
		Given rotoworld has posted a new update on a specific player
		When my application scrapes rotoworld for new updates
		Then I should see that new update in my player feed
		test

