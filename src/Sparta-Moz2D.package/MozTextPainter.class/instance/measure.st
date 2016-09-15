measurement
measure
	| metricsProvider textRun |

	metricsProvider := self createMetricsProvider.

	textRun := font makeTextRun: string canvas: canvas flags: metricsProvider flags.
	metricsProvider measureTextRun: textRun.

	^ metricsProvider