private - ffi
primInitHyphenationBreaks: aHyphenationBreaks hyphensOption: aHyphensOption hyphenWidth: aHyphenWidth spacing: aSpacing drawTarget: aDrawTarget appUnitsPerDevUnit: anAppUnitsPerDevUnit

	^ self ffiCall: #(void moz2d_text_run_property_provider_init (
		self,
		MozTextPropertyHyphenationBreaksCallback aHyphenationBreaks,
		MozTextPropertyHyphensOptionCallback aHyphensOption,
		MozTextPropertyHyphenWidthCallback aHyphenWidth,
		MozTextPropertySpacingCallback aSpacing,
		MozTextPropertyDrawTargetCallback aDrawTarget,
		MozTextPropertyAppUnitsCallback anAppUnitsPerDevUnit))