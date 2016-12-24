instance creation
makeTextRun: aString canvas: canvas flags: aFlags
	^ (self makeTextRunNoRelease: aString canvas: canvas flags: aFlags)
		autoRelease;
		yourself