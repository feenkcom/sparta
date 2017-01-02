measurement
measure
	| aMetrics aMetricsProvider aTextRun |

	aMetrics := self metrics.
	aMetricsProvider := self metricsProvider.
	aTextRun := self textRun.

	aMetricsProvider processRequest: aMetrics with: aTextRun.

	aTextRun release.

	^ aMetrics