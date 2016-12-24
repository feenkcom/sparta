measurement
measure
	| metricsProvider aTextRun |

	metricsProvider := self metricsProvider.
	maxWidth ifNotNil: [ metricsProvider width: maxWidth ].
	metricsProvider enableFontMetrics.

	aTextRun := font makeTextRunNoRelease: text canvas: canvas flags: metricsProvider flags.
	metricsProvider measureTextRun: aTextRun.
	aTextRun release.

	^ metricsProvider