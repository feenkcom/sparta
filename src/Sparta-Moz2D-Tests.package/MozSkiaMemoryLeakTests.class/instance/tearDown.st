running
tearDown
	super tearDown.
	
	canvas release.
	canvas := nil