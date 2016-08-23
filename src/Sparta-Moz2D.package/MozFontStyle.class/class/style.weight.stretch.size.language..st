instance creation
style: aStyle weight: aWeight stretch: aStretch size: aSize language: aLanguage

	^ self
		style: aStyle
		weight: aWeight
		stretch: aStretch
		size: aSize
		sizeAdjust: -1.0
		language: aLanguage
		isExplicitLanguage: false
		languageOverride: ''
		isSystemFont: true
		isPrinterFont: false
		isWeightSynthesis: true
		isStyleSynthesis: true