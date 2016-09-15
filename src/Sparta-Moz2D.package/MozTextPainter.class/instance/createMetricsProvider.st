instance creation
createMetricsProvider
	|metricsProvider|
	metricsProvider := MozTextMetricsProvider new.
	metricsProvider enableFontMetrics.
	metricsProvider flags: orientation value.
	metricsProvider breakPriority: breakPriority.
	metricsProvider string: string.
	metricsProvider spacing: spacing.
	metricsProvider canvas: canvas.
	metricsProvider start: start.
	metricsProvider length: end - start + 1.
	^ metricsProvider