Class {
	#name : #SpartaCairoTextRun,
	#superclass : #Object,
	#traits : 'TSpTextRun',
	#classTraits : 'TSpTextRun classTrait',
	#instVars : [
		'glyphs',
		'buffer',
		'bits',
		'length',
		'scaledFont',
		'metricsProvider'
	],
	#category : #'Sparta-Cairo-Text'
}

{ #category : #'external resource management' }
SpartaCairoTextRun >> autoRelease [
	glyphs autoRelease
]

{ #category : #accessing }
SpartaCairoTextRun >> bits [
	"Return how many bits one character takes"
	<return: #Number>
	
	^ bits
]

{ #category : #accessing }
SpartaCairoTextRun >> bits: aNumber [
	bits := aNumber
]

{ #category : #accessing }
SpartaCairoTextRun >> buffer [
	"Return a byte buffer that is represented by this text run"
	<return: #ArrayedCollection>
	
	^ buffer
]

{ #category : #accessing }
SpartaCairoTextRun >> buffer: anObject [
	buffer := anObject
]

{ #category : #accessing }
SpartaCairoTextRun >> glyphs [
	^ glyphs
]

{ #category : #accessing }
SpartaCairoTextRun >> glyphs: anObject [
	glyphs := anObject
]

{ #category : #testing }
SpartaCairoTextRun >> isNull [

	^ glyphs isNil
]

{ #category : #accessing }
SpartaCairoTextRun >> length [
	"Return amount of glyphs that build this text run.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code,
	it is recommended to use #iterator for text run enumeration"
	<return: #Number>
	
	^ length
]

{ #category : #accessing }
SpartaCairoTextRun >> length: anObject [
	length := anObject
]

{ #category : #accessing }
SpartaCairoTextRun >> metricsProvider [
	"Return a metrics provider that is used to measure this text run"
	<return: #SpartaMetricsProvider>

	^ metricsProvider
]

{ #category : #accessing }
SpartaCairoTextRun >> metricsProvider: aMetricsProvider [
	metricsProvider := aMetricsProvider
]

{ #category : #'external resource management' }
SpartaCairoTextRun >> release [
	glyphs free.
	glyphs := nil.
	scaledFont := nil
]

{ #category : #accessing }
SpartaCairoTextRun >> scaledFont [
	^ scaledFont
]

{ #category : #accessing }
SpartaCairoTextRun >> scaledFont: anObject [
	scaledFont := anObject
]

{ #category : #accessing }
SpartaCairoTextRun >> size [
	^ glyphs size
]
