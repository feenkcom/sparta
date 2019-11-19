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
SpartaTransformationRotation >> degrees: anObject [
	degrees := anObject
]
