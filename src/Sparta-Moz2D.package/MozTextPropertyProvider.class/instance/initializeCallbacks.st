initialization
initializeCallbacks

	self flag: #TODO. "Callbacks do not work on Windows"
	OSPlatform current isWindows
	   ifTrue: [ ^ self ].

	self
		primInitHyphenationBreaks: MozTextPropertyHyphenationBreaksCallback uniqueInstance
		hyphenWidth: MozTextPropertyHyphenWidthCallback uniqueInstance
		spacing: MozTextPropertySpacingCallback uniqueInstance
		drawTarget: MozTextPropertyDrawTargetCallback uniqueInstance
		appUnitsPerDevUnit: MozTextPropertyAppUnitsCallback uniqueInstance