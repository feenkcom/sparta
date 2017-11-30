updating
update
	| msRefreshRate isTimeForRefresh |

	msRefreshRate := 60 "roughly 16 times per second".
	isTimeForRefresh := Time millisecondClockValue - lastUpdate >= msRefreshRate.
	(self isInWorld and: [ isTimeForRefresh ])
		ifFalse: [ ^ self ].
	
	self updateNow