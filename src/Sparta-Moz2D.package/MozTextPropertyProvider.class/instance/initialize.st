initialization
initialize
	"Do not send super initialize, otherwise handle is reset to 0"
	
	getAppUnitsPerDevUnitFn := self createGetAppUnitsPerDevUnitFn.
	getDrawTargetFn := self createGetDrawTargetFn.
	getHyphenWidthFn := self createGetHyphenWidthFn.
	getHyphenationBreaksFn := self createGetHyphenationBreaksFn.
	getHyphensOption := self createGetHyphensOptionFn.
	getSpacingFn := self createGetSpacingFn.

	self
		primInitHyphenationBreaks: getHyphenationBreaksFn
		hyphensOption: getHyphensOption
		hyphenWidth: getHyphenWidthFn
		spacing: getSpacingFn
		drawTarget: getDrawTargetFn
		appUnitsPerDevUnit: getAppUnitsPerDevUnitFn