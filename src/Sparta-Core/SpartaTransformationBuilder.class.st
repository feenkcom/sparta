"
! SpartaTransformationBuilder

I am a transformation builder used to help developers work  with canvas transformation matrix.

!! Overview

I provide a way to manage canvas transformation. ==SpartaCanvas== is almost stateless and transformation is shared between draw operation. This results in a bit more complex management, transformation matrix should be put on top of the stack before modification so that it can be restored later. ==#push== and ==#pop== methods are responsible for stack management.

In order to function properly, users  should take care about possible errors and make sure that all pushes are balanced with corresponding pop even if there was an ==Exception==. For that purpose I provide ==#during:== method that accepts block closure and makes sure that all modifications to transformation matrix stay only within block's scope.

For optimization reasons I do not change transformation of a canvas on every modification, instead I implement transaction-commit pattern. All modifications to transformation matrix are collected and need to be applied by sending ==#apply== message. Once applied current transformation is reset in the builder  and replaced by identity transformation, ready for next transaction.

I operate on ==SpartaMatrix==. However, any polymorphic Transform object can work (for example ==AthensAffineTransform==). Transformation matrix can be set directly using ==#set:== method or modified in place by one of multiple provided methods: ==translateBy:==, ==scaleBy:==, ==multiplyBy:==, ==rotateBy*:==

In general, transformation is backend specific and should be only managed by me. At the same time I can be backend specific, so users should only rely on builders provided by canvas. 

!! Public API and Key Messages

- ==apply== - commit changes and apply them on the canvas
- ==push== - puts current transformation matrix on the stack
- ==pop== - balances one push on the stack
- ==set:== - set transformation matrix to provided one
- ==during:== scopes all modifications to transformation  inside of block closure
- ==matrix== - returns current 
- ==translateBy:== apply translation by a point
- ==scaleBy:== apply scale transformation by a factor as number or point
- ==multiplyBy:== - concatenate current transformation with provided one
- ==rotateByDegrees:== rotate clockwise by amount of degrees
- ==rotateByRadians:== rotate clockwise by amount of radians

!! Example: 

Changing transformation with manual stack management:
[[[language=smalltalk
canvas transform
	push;
	translateBy: 20@10;
	scaleBy: 0.8;
	rotateByDegrees: 45;
	apply.

canvas pop.
]]]

Scoping modifications within block closure:
[[[language=smalltalk
canvas transform during: [
	canvas transform
		translateBy: 20;
		apply.
]
""transformation is automatically restored""
]]]

!! Internal Representation and Key Implementation Points.

!!! Instance Variables
 - transformation:	==<SpartaMatrix>==

"
Class {
	#name : #SpartaTransformationBuilder,
	#superclass : #SpartaAbstractBuilder,
	#traits : 'TSpartaTransformable',
	#classTraits : 'TSpartaTransformable classTrait',
	#instVars : [
		'transformation'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #transformation }
SpartaTransformationBuilder >> apply [
	self deprecated: 'Use `push` instead'
]

{ #category : #transformation }
SpartaTransformationBuilder >> by: aTransformationBlock during: aDuringBlock [

	"we build a transformation within transformation block.
	it will be applied only within during block"
	aTransformationBlock cull: self.
	[ self push. aDuringBlock value ] ensure: [ self pop ]
]

{ #category : #accessing }
SpartaTransformationBuilder >> current [
	"Return a current transformation matrix of the canvas"
	<return: #SpartaMatrix>

	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaTransformationBuilder >> drawSurface: aSpartaSurface transformed: aMatrix4x4 [
	"Default implementation does not take 3D transformation matrix into account"
	self canvas fill
		paint: aSpartaSurface;
		path: aSpartaSurface bounds;
		draw
]

{ #category : #transformation }
SpartaTransformationBuilder >> during: aBlock [
	self deprecated: 'Use `by:during:` instead'.

	self push.
	[ aBlock cull: self ] ensure: [
		self pop ]
]

{ #category : #transformation }
SpartaTransformationBuilder >> matrix [

	^ transformation
]

{ #category : #transformation }
SpartaTransformationBuilder >> pop [
	^ self subclassResponsibility
]

{ #category : #transformation }
SpartaTransformationBuilder >> push [
	^ self push: transformation
]

{ #category : #transformation }
SpartaTransformationBuilder >> push: aSpartaMatrix [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaTransformationBuilder >> reset [
	super reset.
	transformation := SpartaMatrix new
]

{ #category : #transformations }
SpartaTransformationBuilder >> set: aMatrix [

	transformation := SpartaMatrix new loadAffineTransform: aMatrix
]

{ #category : #accessing }
SpartaTransformationBuilder >> transformation [
	^ transformation
]
