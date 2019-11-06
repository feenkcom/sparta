Class {
	#name : #SkiaTextRun,
	#superclass : #Object,
	#traits : 'TSpTextRun',
	#classTraits : 'TSpTextRun classTrait',
	#instVars : [
		'boxerString',
		'metricsProvider',
		'buffer',
		'textBlob'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'instance creation' }
SkiaTextRun class >> fromString: aString font: aFont [
	^ self new initializeWith: aString font: aFont
]

{ #category : #accessing }
SkiaTextRun >> bits [
	"Return how many bits one character takes"
	<return: #Number>
	
	^ 32
]

{ #category : #accessing }
SkiaTextRun >> buffer [
	"Return a byte buffer that is represented by this text run"
	<return: #ArrayedCollection>
	
	^ buffer
]

{ #category : #initialization }
SkiaTextRun >> initializeWith: aString font: aFont [
	boxerString := GtBoxerString fromString: aString.
	buffer := boxerString asArray.
	textBlob := SkiaTextBlob text: boxerString font: aFont
]

{ #category : #accessing }
SkiaTextRun >> length [
	"Return amount of glyphs that build this text run.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code,
	it is recommended to use #iterator for text run enumeration"
	<return: #Number>
	
	^ boxerString length
]

{ #category : #accessing }
SkiaTextRun >> metricsProvider [
	"Return a metrics provider that is used to measure this text run"
	<return: #SpartaMetricsProvider>

	^ metricsProvider
]

{ #category : #accessing }
SkiaTextRun >> metricsProvider: aSpMetricsProvider [
	"Change metrics provider that should be used to measure this text run"

	metricsProvider := aSpMetricsProvider
]
