instance creation
textRun
	^ ((font scaledFontFor: canvas transform current) makeTextRunNoRelease: text)
		metricsProvider: self metricsProvider; "do not forget to set a default metrics provider"
		yourself