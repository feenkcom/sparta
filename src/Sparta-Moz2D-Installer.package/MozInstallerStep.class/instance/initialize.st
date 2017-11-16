initialization
initialize
	super initialize.
	
	isActive := false.
	isDone := false.

	beacon := Beacon new.

	title := self defaultTitle