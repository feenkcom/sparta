Class {
	#name : #SkiaMetricsProvider,
	#superclass : #SpartaMetricsProvider,
	#instVars : [
		'font'
	],
	#category : #'Sparta-Skia-Text'
}

{ #category : #accessing }
SkiaMetricsProvider >> font [
	<return: #SkiaFont>

	^ font
]

{ #category : #accessing }
SkiaMetricsProvider >> font: aSkiaFont [
	font := aSkiaFont
]

{ #category : #measurement }
SkiaMetricsProvider >> measure: aSpartaTextRun in: aSpartaMetrics [
	"Measure a given text run according to provided requested properties in aSpartaMetrics
	and store text and font measurement in aSpartaMetrics"

	aSpartaMetrics textMetrics: (SpartaTextMetrics new
		advance: aSpartaTextRun advance;
		bounds: aSpartaTextRun bounds).
	aSpartaMetrics fontMetrics: font metrics
]
