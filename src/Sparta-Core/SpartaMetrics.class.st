"
I represent a metrics request.

I hold all neccessary information that is needed by metrics provider in order to measure provided text run.
"
Class {
	#name : #SpartaMetrics,
	#superclass : #Object,
	#instVars : [
		'orientation',
		'breakPriority',
		'spacing',
		'textRun',
		'propertyProvider',
		'lineBreakBefore',
		'suppressBreaks',
		'measureFont',
		'measureText',
		'fontMetrics',
		'textMetrics',
		'boxType',
		'canvas',
		'isVertical'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaMetrics >> boxType [
	^ boxType
]

{ #category : #accessing }
SpartaMetrics >> boxType: aBoundingBoxType [
	boxType := aBoundingBoxType
]

{ #category : #accessing }
SpartaMetrics >> breakPriority [
	^ breakPriority
]

{ #category : #accessing }
SpartaMetrics >> breakPriority: anObject [
	breakPriority := anObject
]

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
	^ fontMetrics
]

{ #category : #metrics }
SpartaMetrics >> fontMetrics: aSpFontMetrics [

	self
		assert: [ measureFont ]
		description: [ 'I must have been requested font metrics in order to get them' ].

	fontMetrics := aSpFontMetrics
]

{ #category : #initialization }
SpartaMetrics >> initialize [
	super initialize.
	
	measureFont := true.
	measureText := true.
	isVertical := false
]

{ #category : #accessing }
SpartaMetrics >> isVertical [
	^ isVertical
]

{ #category : #accessing }
SpartaMetrics >> isVertical: anObject [
	isVertical := anObject
]

{ #category : #accessing }
SpartaMetrics >> lineBreakBefore [
	^ lineBreakBefore
]

{ #category : #accessing }
SpartaMetrics >> lineBreakBefore: aBoolean [
	"Set to true if and only if there is an actual line break at the start of the text run"

	lineBreakBefore := aBoolean
]

{ #category : #accessing }
SpartaMetrics >> measureFont [
	"Return true if main font of textRun should be measured, false otherwise"
	<return: #Boolean>

	^ measureFont
]

{ #category : #accessing }
SpartaMetrics >> measureFont: aBoolean [
	measureFont := aBoolean
]

{ #category : #accessing }
SpartaMetrics >> measureText [
	"Return true if textRun should be measured, false otherwise"
	<return: #Boolean>

	^ measureText
]

{ #category : #accessing }
SpartaMetrics >> measureText: aBoolean [
	measureText := aBoolean
]

{ #category : #accessing }
SpartaMetrics >> orientation [
	^ orientation
]

{ #category : #accessing }
SpartaMetrics >> orientation: anObject [
	orientation := anObject
]

{ #category : #accessing }
SpartaMetrics >> propertyProvider [
	^ propertyProvider
]

{ #category : #accessing }
SpartaMetrics >> propertyProvider: anObject [
	"Optional. Ask metrics provider to use custom provided property provider"

	propertyProvider := anObject
]

{ #category : #accessing }
SpartaMetrics >> spacing [
	^ spacing
]

{ #category : #accessing }
SpartaMetrics >> spacing: aNumber [
	spacing := aNumber
]

{ #category : #accessing }
SpartaMetrics >> suppressBreaks [
	^ suppressBreaks
]

{ #category : #accessing }
SpartaMetrics >> suppressBreaks: aSuppressBreaks [
	suppressBreaks := aSuppressBreaks
]

{ #category : #metrics }
SpartaMetrics >> textMetrics [
	^ textMetrics
]

{ #category : #metrics }
SpartaMetrics >> textMetrics: aSpTextMetrics [
	
	self
		assert: [ measureText ]
		description: [ 'I must have been requested text metrics in order to get them' ].

	textMetrics := aSpTextMetrics
]

{ #category : #accessing }
SpartaMetrics >> textRun [
	^ textRun
]

{ #category : #accessing }
SpartaMetrics >> textRun: anObject [
	textRun := anObject
]
