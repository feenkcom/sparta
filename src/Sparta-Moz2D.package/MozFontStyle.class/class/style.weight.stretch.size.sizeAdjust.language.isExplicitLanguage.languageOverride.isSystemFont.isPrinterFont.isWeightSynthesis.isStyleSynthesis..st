instance creation
style: aStyle weight: aWeight stretch: aStretch size: aSize sizeAdjust: aSizeAdjust language: aLanguage isExplicitLanguage: aExplicitLanguage languageOverride: aLanguageOverride isSystemFont: aSystemFont isPrinterFont: aPrinterFont isWeightSynthesis: aWeightSynthesis isStyleSynthesis: aStyleSynthesis

	^ (self
		primCreateStyle: aStyle
		w: aWeight
		s: aStretch
		s: aSize
		a: aSizeAdjust
		l: aLanguage
		e: aExplicitLanguage
		o: aLanguageOverride
		i: aSystemFont
		i: aPrinterFont
		i: aWeightSynthesis
		i: aStyleSynthesis)
			autoRelease;
			yourself