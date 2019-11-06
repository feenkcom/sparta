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
		'start',
		'length',
		'textRun',
		'width',
		'propertyProvider',
		'lineBreakBefore',
		'suppressBreaks',
		'measureFont',
		'measureText',
		'fontMetrics',
		'textMetrics',
		'boxType',
		'wrappedLength',
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
SpartaMetrics >> length [
	^ length
]

{ #category : #accessing }
SpartaMetrics >> length: aNumber [
	"Set amount of glyphs starting from #start that should be measured.
	If length is greater than amoung of glyphs in text run, it will be measured until the end.
	Note: one character can be represented by 1 or 2 glyphs depending on encoding"
	
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Length can not be negative' ].
	
	length := aNumber
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
SpartaMetrics >> start [
	^ start
]

{ #category : #accessing }
SpartaMetrics >> start: aNumber [
	start := aNumber
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

{ #category : #accessing }
SpartaMetrics >> width [
	^ width
]

{ #category : #accessing }
SpartaMetrics >> width: aNumber [
	"Metrics will be calculated assuming that space is limited to width.
	Setting width less than text width may result in word wrapping.
	Setting width to Float infinity results in no limit"

	width := aNumber
]

{ #category : #metrics }
SpartaMetrics >> wrappedEnd [
	^ self wrappedLength + start - 1
]

{ #category : #metrics }
SpartaMetrics >> wrappedLength [
	"Return the longest measured text run that will fit into the given width.
	Note: one character can be represented by 1 or 2 glyphs depending on encoding"

	^ wrappedLength
]

{ #category : #metrics }
SpartaMetrics >> wrappedLength: aNumber [

	self
		assert: [ measureText ]
		description: [ 'I must have been requested text metrics in order to computed wrapped length' ].

	wrappedLength := aNumber
]
