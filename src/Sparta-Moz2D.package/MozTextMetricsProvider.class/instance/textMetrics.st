accessing - metrics
textMetrics
	"Return text metrics.
	Note, that you must never strong refer returned text metrics, because it is
	an external object and memory is managed by TextMetricsProvider manually for
	performance reasons."

	^ textMetrics