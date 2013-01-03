Feature: Player Notifications
	Users should receive notifications when an update for their player is receieved

	Scenario: Player is injured
		Given DWW has received an update that a player is injured
		And That player is on a users roster
		When The update is receieved
		Then The user should receive an email notifying them of the update
	