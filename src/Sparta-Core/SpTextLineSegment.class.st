Class {
	#name : #SpTextLineSegment,
	#superclass : #SpTextSegment,
	#instVars : [
		'spans'
	],
	#category : 'Sparta-Core-Text-Rendering'
}

{ #category : #'instance creation' }
SpTextLineSegment class >> rope: aRope spans: aSpansCollection [
	^ self new
		rope: aRope spans: aSpansCollection;
		yourself
]

{ #category : #'instance creation' }
SpTextLineSegment class >> spans: aSpansCollection [
	^ self new
		spans: aSpansCollection;
		yourself
]

{ #category : #accessing }
SpTextLineSegment >> baseline: aPoint [
	super baseline: aPoint.
	
	spans inject: aPoint into: [ :point :span |
		span baseline: point.
		(point x + span width) @ point y ]
]

{ #category : #enumerating }
SpTextLineSegment >> do: aBlock [
	spans do: aBlock
]

{ #category : #finalization }
SpTextLineSegment >> finalize [

	self spans do: [ :aSpan | aSpan finalize ]
]

{ #category : #initialization }
SpTextLineSegment >> initialize [
	super initialize.

	spans := #()
]

{ #category : #printing }
SpTextLineSegment >> printOn: aStream [
	spans do: [ :each | each printOn: aStream ]
]

{ #category : #initialization }
SpTextLineSegment >> rope: aRope spans: anArrayOfSpans [
	spans := anArrayOfSpans.
	rope := aRope.
	from := spans ifEmpty: [ 0 ] ifNotEmpty: [ spans first from ].
	to := spans ifEmpty: [ 0 ] ifNotEmpty: [ spans last to ].
	width := spans ifEmpty: [ 0 ] ifNotEmpty: [ spans sum: #width ].
	height := spans ifEmpty: [ 0 ] ifNotEmpty: [ (spans detectMax: #height) height ].
	ascent := spans ifEmpty: [ 0 ] ifNotEmpty: [ (spans detectMax: #ascent) ascent ].
	descent := spans ifEmpty: [ 0 ] ifNotEmpty: [ (spans detectMax: #descent) descent ].
	length := spans ifEmpty: [ 0 ] ifNotEmpty: [ spans sum: #length ]
]

{ #category : #accessing }
SpTextLineSegment >> spans [
	^ spans
]
