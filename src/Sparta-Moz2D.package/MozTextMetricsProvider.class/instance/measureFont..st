measurement
measureFont: aFontGroup
	| aTextRun aResult |
	aTextRun := aFontGroup makeTextRunNoRelease: string canvas: canvas flags: flags.
	aResult := self measureTextRun: aTextRun.
	aTextRun release.
	^ aResult