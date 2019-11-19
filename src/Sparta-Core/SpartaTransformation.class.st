Class {
	#name : #SpartaTransformation,
	#superclass : #Object,
	#instVars : [
		'operations'
	],
	#category : #'Sparta-Core-Math'
}

{ #category : #converting }
SpartaTransformation >> asMatrix [
	<return: #SpartaMatrix>
	| aSpartaMatrix |
	
	aSpartaMatrix := SpartaMatrix new.
	operations do: [ :eachOperation | eachOperation applyOn: aSpartaMatrix ].
	^ aSpartaMatrix
]

{ #category : #initialization }
SpartaTransformation >> initialize [
	super initialize.
	
	operations := OrderedCollection new
]

{ #category : #testing }
SpartaTransformation >> isIdentity [
	operations
		ifEmpty: [ ^ true ].

	^ operations allSatisfy: #isIdentity
]

{ #category : #'api - transformations' }
SpartaTransformation >> multiplyBy: aMatrix [
	operations add: (SpartaTransformationConcatenation new matrix: aMatrix)
]

{ #category : #enumerating }
SpartaTransformation >> operationsDo: aBlock [
	operations do: aBlock
]

{ #category : #'api - transformations' }
SpartaTransformation >> rotateByDegrees: anAngle [
	operations add: (SpartaTransformationRotation new degrees: anAngle)
]

{ #category : #'api - transformations' }
SpartaTransformation >> rotateByRadians: anAngle [
	self rotateByDegrees: anAngle radiansToDegrees
]

{ #category : #'api - transformations' }
SpartaTransformation >> scaleBy: aPointOrNumber [

	aPointOrNumber isPoint
		ifTrue: [ self scaleX: aPointOrNumber x Y: aPointOrNumber y ]
		ifFalse: [ self scaleX: aPointOrNumber Y: aPointOrNumber ]
]

{ #category : #'api - transformations' }
SpartaTransformation >> scaleX: aX Y: aY [
	operations add: (SpartaTransformationScale new scaleX: aX; scaleY: aY)
]

{ #category : #'api - transformations' }
SpartaTransformation >> translateBy: aPointOrNumber [
	aPointOrNumber isPoint
		ifTrue: [ self translateX: aPointOrNumber x Y: aPointOrNumber y ]
		ifFalse: [ self translateX: aPointOrNumber Y: aPointOrNumber ]
]

{ #category : #'api - transformations' }
SpartaTransformation >> translateX: aX Y: aY [
	operations add: (SpartaTransformationTranslation new deltaX: aX; deltaY: aY)
]
