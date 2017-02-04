instance creation
metricsProvider
	"Instantiate and return a backend specific metrics provider that handles SpMetrics request.
	Note: metrics provider is created according to current font and text properties and therefore
	should be instantiated only after text painter is fully configured"
	<return: #SpMetricsProvider>

	^ self subclassResponsibility