measurement
measure
	| aMetrics aMetricsProvider aTextRun |
	aMetrics := self metrics.
	aMetricsProvider := self metricsProvider.
	aTextRun := self textRun.
	aMetricsProvider measure: aTextRun in: aMetrics.
	aTextRun release.
	^ aMetrics