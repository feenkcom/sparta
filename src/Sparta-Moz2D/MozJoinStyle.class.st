"
I represent a line join style.

	BEVEL - Fills an additional triangular area between the common endpoint of connected segments, and the separate outside rectangular corners of each segment.
	MITER - Connected segments are joined by extending their outside edges to connect at a single point, with the effect of filling an additional lozenge-shaped area. This setting is effected by the miterLimit property.
	MITER_OR_BEVEL - Use Miter if supported by backend, otherwise fallback to bevel
	ROUND - Rounds off the corners of a shape by filling an additional sector of disc centered at the common endpoint of connected segments. The radius for these rounded corners is equal to the line width.
	
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
"
Class {
	#name : #MozJoinStyle,
	#superclass : #MozEnum,
	#classVars : [
		'BEVEL',
		'MITER',
		'MITER_OR_BEVEL',
		'ROUND'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozJoinStyle class >> BEVEL [
	"This method was automatically generated"
	^ BEVEL
]

{ #category : #'accessing enum' }
MozJoinStyle class >> MITER [
	"This method was automatically generated"
	^ MITER
]

{ #category : #'accessing enum' }
MozJoinStyle class >> MITER_OR_BEVEL [
	"This method was automatically generated"
	^ MITER_OR_BEVEL
]

{ #category : #'accessing enum' }
MozJoinStyle class >> ROUND [
	"This method was automatically generated"
	^ ROUND
]

{ #category : #'enum declaration' }
MozJoinStyle class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	BEVEL 0
	ROUND 1
	MITER 2   "Mitered if within the miter limit, else, if the backed supports
				  it (D2D), the miter is clamped. If the backend does not support
				  miter clamping the behavior is as for MITER_OR_BEVEL."
	MITER_OR_BEVEL 3 "Mitered if within the miter limit, else beveled."
	)
]

{ #category : #accessing }
MozJoinStyle class >> externalEnum [
	^ #JoinStyle
]

{ #category : #accessing }
MozJoinStyle class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozJoinStyle class >> initialize [
	super initialize
]
