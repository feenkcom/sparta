private - ffi
primCreateStyle: aStyle weight: aWeight stretch: aStretch size: aSize sizeAdjust: aSizeAdjust language: aLanguage isExplicitLanguage: aExplicitLanguage languageOverride: aLanguageOverride isSystemFont: aSystemFont isPrinterFont: aPrinterFont isWeightSynthesis: aWeightSynthesis isStyleSynthesis: aStyleSynthesis

	^ self ffiCall: #(MozFontStyle moz2d_font_style_create (
		int aStyle,
		int aWeight,
		int aStretch,
		float aSize,
		String aLanguage,
		bool aExplicitLanguage,
		float aSizeAdjust,
		bool aSystemFont,
		bool aPrinterFont,
		bool aWeightSynthesis,
		bool aStyleSynthesis,
		ByteString aLanguageOverride))