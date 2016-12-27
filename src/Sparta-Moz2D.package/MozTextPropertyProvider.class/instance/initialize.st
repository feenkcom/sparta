initialization
initialize
	"Do not send super initialize, otherwise handle is reset to 0"

	self
		primInitHyphenationBreaks: MozTextPropertyHyphenationBreaksCallback uniqueInstance
		hyphenWidth: MozTextPropertyHyphenWidthCallback uniqueInstance
		spacing: MozTextPropertySpacingCallback uniqueInstance
		drawTarget: MozTextPropertyDrawTargetCallback uniqueInstance
		appUnitsPerDevUnit: MozTextPropertyAppUnitsCallback uniqueInstance