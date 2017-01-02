instance creation
makeTextRun: aString canvas: canvas flags: aFlags
	| aTextRun |

	aTextRun := (self makeTextRunNoRelease: aString canvas: canvas flags: aFlags).
	
	aTextRun	autoRelease.
	^ aTextRun