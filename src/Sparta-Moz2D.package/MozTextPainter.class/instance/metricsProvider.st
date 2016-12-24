instance creation
metricsProvider
	| aMetricsProvider |
	aMetricsProvider := MozTextMetricsProvider new.
	aMetricsProvider orientation: orientation.
	aMetricsProvider breakPriority: breakPriority.
	aMetricsProvider string: text.
	aMetricsProvider spacing: spacing.
	aMetricsProvider canvas: canvas.
	aMetricsProvider start: start.
	aMetricsProvider length: end - start + 1.
	^ aMetricsProvider