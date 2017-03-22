measuring
measureOn: aSpMetrics
	"Measure me with the help of current #metricsProvider based on
	parameters specified in aSpMetrics and store measurement results in it"
	
	self metricsProvider measure: self in: aSpMetrics