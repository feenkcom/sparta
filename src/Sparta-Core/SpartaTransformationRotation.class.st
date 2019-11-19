Class {
	#name : #SpartaTransformationRotation,
	#superclass : #SpartaTransformationOperation,
	#instVars : [
		'degrees'
	],
	#category : #'Sparta-Core-Math'
}

{ #category : #dispatch }
SpartaTransformationRotation >> applyOn: aSpartaMatrix [
	aSpartaMatrix rotateByDegrees: degrees
]

{ #category : #accessing }
SpartaTransformationRotation >> degrees [
	^ degrees
]

{ #category : #accessing }
SpartaTransformationRotation >> degrees: aNumber [
	degrees := aNumber asFloat
]

{ #category : #testing }
SpartaTransformationRotation >> isIdentity [
	<return: #Boolean>

	^ degrees isZero
]

{ #category : #enumerating }
SpartaTransformationRotation >> rotationDo: aBlock [
	self isIdentity
		ifFalse: [ aBlock value: degrees ]
]
