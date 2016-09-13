measurement
measure
	| metricsProvider textRun |
	
	metricsProvider := MozTextMetricsProvider new.
	metricsProvider flags: (orientation ifNil: [ MozTextOrientation HORIZONTAL ]) value.
	metricsProvider breakPriority: breakPriority.
	metricsProvider string: string.
	metricsProvider canvas: canvas.
	textRun := font makeTextRun: string canvas: canvas flags: metricsProvider flags.
	metricsProvider measureTextRun: textRun.

	^ metricsProvider