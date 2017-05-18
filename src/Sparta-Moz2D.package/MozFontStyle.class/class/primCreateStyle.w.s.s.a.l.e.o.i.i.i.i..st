private - ffi
primCreateStyle: aStyle w: aWeight s: aStretch s: aSize a: aSizeAdjust l: aLanguage e: aExplicitLanguage o: aLanguageOverride i: aSystemFont i: aPrinterFont i: aWeightSynthesis i: aStyleSynthesis
	"My full name is:
	
	primCreateStyle: aStyle weight: aWeight stretch: aStretch size: aSize sizeAdjust: aSizeAdjust language: aLanguage isExplicitLanguage: aExplicitLanguage languageOverride: aLanguageOverride isSystemFont: aSystemFont isPrinterFont: aPrinterFont isWeightSynthesis: aWeightSynthesis isStyleSynthesis: aStyleSynthesis
	
	The problem is that on windows this method has too long file name (.st file) and can not be handled by filesystem"
	
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