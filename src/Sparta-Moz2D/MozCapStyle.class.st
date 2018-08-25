"
I represent a line cap style.

	BUTT - The ends of lines are squared off at the endpoints.
	ROUND - The ends of lines are rounded.
	SQUARE - The ends of lines are squared off by adding a box with an equal width and half the height of the line's thickness.
	
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
"
Class {
	#name : #MozCapStyle,
	#superclass : #MozEnum,
	#classVars : [
		'BUTT',
		'ROUND',
		'SQUARE'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozCapStyle class >> BUTT [
	"This method was automatically generated"
	^ BUTT
]

{ #category : #'accessing enum' }
MozCapStyle class >> ROUND [
	"This method was automatically generated"
	^ ROUND
]

{ #category : #'accessing enum' }
MozCapStyle class >> SQUARE [
	"This method was automatically generated"
	^ SQUARE
]

{ #category : #'enum declaration' }
MozCapStyle class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	BUTT 0
	ROUND 1
	SQUARE 2
	)
]

{ #category : #accessing }
MozCapStyle class >> externalEnum [
	^ #CapStyle
]

{ #category : #accessing }
MozCapStyle class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozCapStyle class >> initialize [
	super initialize
]
