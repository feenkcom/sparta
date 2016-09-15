accessing
metrics: isVertical
	|metrics |
	metrics := MozFontMetrics externalNew.
	self primGetMetrics: metrics orientation: isVertical.
	^ metrics