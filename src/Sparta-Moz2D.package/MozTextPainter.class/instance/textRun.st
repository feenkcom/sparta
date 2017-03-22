instance creation
textRun

	^ (font
		makeTextRunNoRelease: text
		canvas: canvas
		flags: self flags)
			metricsProvider: self metricsProvider; "do not forget to set a default metrics provider"
			yourself