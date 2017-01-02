accessing
metrics: isVertical
	|metrics |
	metrics := MozNativeFontMetrics externalNew.
	self primGetMetrics: metrics orientation: isVertical.
	metrics autoRelease.
	^ metrics