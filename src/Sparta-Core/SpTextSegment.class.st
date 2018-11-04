Class {
	#name : #SpTextSegment,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'ascent',
		'descent',
		'baseline',
		'box',
		'length',
		'from',
		'to',
		'rope'
	],
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #'instance creation' }
SpTextSegment class >> rope: aRope from: aStart to: anEnd [
	^ self new
		rope: aRope from: aStart to: anEnd
]

{ #category : #accessing }
SpTextSegment >> ascent [
	^ ascent
]

{ #category : #accessing }
SpTextSegment >> baseline [
	^ baseline
]

{ #category : #accessing }
SpTextSegment >> baseline: aPoint [
	baseline := aPoint
]

{ #category : #accessing }
SpTextSegment >> box [
	^ box
]

{ #category : #accessing }
SpTextSegment >> descent [
	^ descent
]

{ #category : #accessing }
SpTextSegment >> extent [
	^ self width @ self height
]

{ #category : #accessing }
SpTextSegment >> from [
	^ from
]

{ #category : #accessing }
SpTextSegment >> height [
	^ height
]

{ #category : #initialization }
SpTextSegment >> initialize [
	super initialize.

	width := 0.
	height := 0
]

{ #category : #accessing }
SpTextSegment >> length [
	^ length
]

{ #category : #accessing }
SpTextSegment >> origin [
	^ self baseline x @ (self baseline y - self ascent)
]

{ #category : #accessing }
SpTextSegment >> rope [
	^ rope
]

{ #category : #accessing }
SpTextSegment >> to [
	^ to
]

{ #category : #accessing }
SpTextSegment >> width [
	^ width
]
