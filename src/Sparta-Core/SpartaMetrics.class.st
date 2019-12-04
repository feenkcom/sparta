"
I represent a metrics request.

I hold all neccessary information that is needed by metrics provider in order to measure provided text run.
"
Class {
	#name : #SpartaMetrics,
	#superclass : #Object,
	#instVars : [
		'spacing',
		'fontMetrics',
		'textMetrics',
		'canvas'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaMetrics >> canvas [
	^ canvas
]

{ #category : #accessing }
SpartaMetrics >> canvas: aSpartaCanvas [
	canvas := aSpartaCanvas
]

{ #category : #metrics }
SpartaMetrics >> fontMetrics [
	<return: #SpartaFontMetrics>

	^ fontMetrics
]

{ #category : #metrics }
SpartaMetrics >> fontMetrics: aSpFontMetrics [
	fontMetrics := aSpFontMetrics
]

{ #category : #initialization }
SpartaMetrics >> initialize [
	super initialize.
	
	spacing := 0
]

{ #category : #accessing }
SpartaMetrics >> spacing [
	<return: #Number>

	^ spacing
]

{ #category : #accessing }
SpartaMetrics >> spacing: aNumber [
	spacing := aNumber
]

{ #category : #metrics }
SpartaMetrics >> textMetrics [
	<return: #SpartaTextMetrics>

	^ textMetrics
]

{ #category : #metrics }
SpartaMetrics >> textMetrics: aSpTextMetrics [
	textMetrics := aSpTextMetrics
]
