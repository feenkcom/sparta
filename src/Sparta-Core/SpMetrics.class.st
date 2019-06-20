"
I represent a metrics request.

I hold all neccessary information that is needed by metrics provider in order to measure provided text run.
"
Class {
	#name : #SpMetrics,
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
SpMetrics >> boxType [
	^ boxType
]

{ #category : #accessing }
SpMetrics >> boxType: aBoundingBoxType [
	boxType := aBoundingBoxType
]

{ #category : #accessing }
SpMetrics >> breakPriority [
	^ breakPriority
]

{ #category : #accessing }
SpMetrics >> breakPriority: anObject [
	breakPriority := anObject
]

{ #category : #accessing }
SpMetrics >> canvas [
	^ canvas
]

{ #category : #accessing }
SpMetrics >> canvas: aSpartaCanvas [
	canvas := aSpartaCanvas
]

{ #category : #metrics }
SpMetrics >> fontMetrics [
	^ fontMetrics
]

{ #category : #metrics }
SpMetrics >> fontMetrics: aSpFontMetrics [

	self
		assert: [ measureFont ]
		description: [ 'I must have been requested font metrics in order to get them' ].

	fontMetrics := aSpFontMetrics
]

{ #category : #initialization }
SpMetrics >> initialize [
	super initialize.
	
	measureFont := true.
	measureText := true.
	isVertical := false
]

{ #category : #accessing }
SpMetrics >> isVertical [
	^ isVertical
]

{ #category : #accessing }
SpMetrics >> isVertical: anObject [
	isVertical := anObject
]

{ #category : #accessing }
SpMetrics >> length [
	^ length
]

{ #category : #accessing }
SpMetrics >> length: aNumber [
	"Set amount of glyphs starting from #start that should be measured.
	If length is greater than amoung of glyphs in text run, it will be measured until the end.
	Note: one character can be represented by 1 or 2 glyphs depending on encoding"
	
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Length can not be negative' ].
	
	length := aNumber
]

{ #category : #accessing }
SpMetrics >> lineBreakBefore [
	^ lineBreakBefore
]

{ #category : #accessing }
SpMetrics >> lineBreakBefore: aBoolean [
	"Set to true if and only if there is an actual line break at the start of the text run"

	lineBreakBefore := aBoolean
]

{ #category : #accessing }
SpMetrics >> measureFont [
	"Return true if main font of textRun should be measured, false otherwise"
	<return: #Boolean>

	^ measureFont
]

{ #category : #accessing }
SpMetrics >> measureFont: aBoolean [
	measureFont := aBoolean
]

{ #category : #accessing }
SpMetrics >> measureText [
	"Return true if textRun should be measured, false otherwise"
	<return: #Boolean>

	^ measureText
]

{ #category : #accessing }
SpMetrics >> measureText: aBoolean [
	measureText := aBoolean
]

{ #category : #accessing }
SpMetrics >> orientation [
	^ orientation
]

{ #category : #accessing }
SpMetrics >> orientation: anObject [
	orientation := anObject
]

{ #category : #accessing }
SpMetrics >> propertyProvider [
	^ propertyProvider
]

{ #category : #accessing }
SpMetrics >> propertyProvider: anObject [
	"Optional. Ask metrics provider to use custom provided property provider"

	propertyProvider := anObject
]

{ #category : #accessing }
SpMetrics >> spacing [
	^ spacing
]

{ #category : #accessing }
SpMetrics >> spacing: aNumber [
	spacing := aNumber
]

{ #category : #accessing }
SpMetrics >> start [
	^ start
]

{ #category : #accessing }
SpMetrics >> start: aNumber [
	start := aNumber
]

{ #category : #accessing }
SpMetrics >> suppressBreaks [
	^ suppressBreaks
]

{ #category : #accessing }
SpMetrics >> suppressBreaks: aSuppressBreaks [
	suppressBreaks := aSuppressBreaks
]

{ #category : #metrics }
SpMetrics >> textMetrics [
	^ textMetrics
]

{ #category : #metrics }
SpMetrics >> textMetrics: aSpTextMetrics [
	
	self
		assert: [ measureText ]
		description: [ 'I must have been requested text metrics in order to get them' ].

	textMetrics := aSpTextMetrics
]

{ #category : #accessing }
SpMetrics >> textRun [
	^ textRun
]

{ #category : #accessing }
SpMetrics >> textRun: anObject [
	textRun := anObject
]

{ #category : #accessing }
SpMetrics >> width [
	^ width
]

{ #category : #accessing }
SpMetrics >> width: aNumber [
	"Metrics will be calculated assuming that space is limited to width.
	Setting width less than text width may result in word wrapping.
	Setting width to Float infinity results in no limit"

	width := aNumber
]

{ #category : #metrics }
SpMetrics >> wrappedEnd [
	^ self wrappedLength + start - 1
]

{ #category : #metrics }
SpMetrics >> wrappedLength [
	"Return the longest measured text run that will fit into the given width.
	Note: one character can be represented by 1 or 2 glyphs depending on encoding"

	^ wrappedLength
]

{ #category : #metrics }
SpMetrics >> wrappedLength: aNumber [

	self
		assert: [ measureText ]
		description: [ 'I must have been requested text metrics in order to computed wrapped length' ].

	wrappedLength := aNumber
]
