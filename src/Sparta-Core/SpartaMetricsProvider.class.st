Class {
	#name : #SpartaMetricsProvider,
	#superclass : #Object,
	#category : #'Sparta-Core-Text'
}

{ #category : #measurement }
SpartaMetricsProvider >> measure: aSpTextRun in: aSpMetrics [
	"Measure a given text run according to provided requested properties in aSpMetrics
	and store text and font measurement in aSpMetrics"

	self subclassResponsibility
]
