instance creation
fromLogicalFont: aLogicalFont

	^ self
		primCreateStyle: aLogicalFont slantValue
		weight: aLogicalFont weightValue
		stretch: aLogicalFont stretchValue
		size: aLogicalFont pixelSize
		sizeAdjust: -1.0
		language: 'en'
		isExplicitLanguage: false
		languageOverride: ''
		isSystemFont: true
		isPrinterFont: false
		isWeightSynthesis: true
		isStyleSynthesis: true