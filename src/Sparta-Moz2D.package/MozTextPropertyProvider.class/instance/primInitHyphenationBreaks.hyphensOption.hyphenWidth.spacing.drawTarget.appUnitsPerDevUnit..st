private - ffi
primInitHyphenationBreaks: aHyphenationBreaks hyphensOption: aHyphensOption hyphenWidth: aHyphenWidth spacing: aSpacing drawTarget: aDrawTarget appUnitsPerDevUnit: anAppUnitsPerDevUnit

	^ self ffiCall: #(void moz2d_text_run_property_provider_init (
		self,
		FFICallback aHyphenationBreaks,
		FFICallback aHyphensOption,
		FFICallback aHyphenWidth,
		FFICallback aSpacing,
		FFICallback aDrawTarget,
		FFICallback anAppUnitsPerDevUnit))