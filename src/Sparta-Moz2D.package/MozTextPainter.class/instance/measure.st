measurement
measure
	| metricsProvider textRun |

	metricsProvider := self createMetricsProvider.
	maxWidth ifNotNil: [ metricsProvider width: maxWidth ].
	metricsProvider enableFontMetrics.

	textRun := font makeTextRun: string canvas: canvas flags: metricsProvider flags.
	metricsProvider measureTextRun: textRun.

	^ metricsProvider