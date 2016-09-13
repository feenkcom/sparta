measurement
measureFont: aFontGroup
	|textRun|
	textRun := aFontGroup makeTextRun: string canvas: canvas flags: flags.
	^ self measureTextRun: textRun