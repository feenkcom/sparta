measurement
fontMetrics
	|metrics |
	metrics := MozNativeFontMetrics externalNew.
	metrics autoRelease.
	self primFontMetrics: metrics.
	^ metrics