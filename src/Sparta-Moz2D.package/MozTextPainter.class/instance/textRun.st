instance creation
textRun

	^ font
		makeTextRunNoRelease: text
		canvas: canvas
		flags: self flags