Class {
	#name : #SkiaMetricsProvider,
	#superclass : #SpartaMetricsProvider,
	#instVars : [
		'font'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #accessing }
SkiaMetricsProvider >> font [
	^ font
]

{ #category : #accessing }
SkiaMetricsProvider >> font: anObject [
	font := anObject
]
