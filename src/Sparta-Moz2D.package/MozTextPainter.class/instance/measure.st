measurement
measure
	| metricsProvider textRun |

	metricsProvider := self createMetricsProvider.
	metricsProvider enableFontMetrics.

	textRun := font makeTextRun: string canvas: canvas flags: metricsProvider flags.
	metricsProvider measureTextRun: textRun.

	^ metricsProvider