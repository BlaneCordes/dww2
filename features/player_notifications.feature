Feature: Player Notifications
	Users should receive email notifications when an update for their player is receieved

	Scenario: Player update is recieved
		Given DWW has received an update on a player
		And That player is on a users roster
		When The update is receieved
		Then The user should receive an email notifying them of the update
