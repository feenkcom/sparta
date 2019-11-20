Class {
	#name : #SkiaMetricsProvider,
	#superclass : #SpartaMetricsProvider,
	#instVars : [
		'font',
		'paint'
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
	"Measure a given text run according to provided requested properties in aSpMetrics
	and store text and font measurement in aSpMetrics"
	| theSkiaTextMetrics |

	theSkiaTextMetrics := font measureText: aSpartaTextRun characters paint: paint.

	aSpartaMetrics textMetrics: theSkiaTextMetrics asSpartaMetrics.
	aSpartaMetrics fontMetrics: font metrics
]

{ #category : #accessing }
SkiaMetricsProvider >> paint [
	<return: #SkiaPaint>

	^ paint
]

{ #category : #accessing }
SkiaMetricsProvider >> paint: aSkiaPaint [
	paint := aSkiaPaint
]
