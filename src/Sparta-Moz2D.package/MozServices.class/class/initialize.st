class initialization
initialize
	super initialize.
	
	isRunning := false.
	SessionManager default registerUserClassNamed: self name atPriority: 0