measurement
fontMetrics
	|metrics |
	metrics := MozFontMetrics externalNew.
	self primFontMetrics: metrics.
	^ metrics