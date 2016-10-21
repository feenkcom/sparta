measurement
fontMetrics
	|metrics |
	metrics := MozFontMetrics externalNew.
	metrics autoRelease.
	self primFontMetrics: metrics.
	^ metrics