Class {
	#name : #SpartaTexture,
	#superclass : #Object,
	#instVars : [
		'extent',
		'format'
	],
	#category : #'Sparta-Core-Utils'
}

{ #category : #accessing }
SpartaTexture >> extent [
	^ extent
]

{ #category : #accessing }
SpartaTexture >> extent: anObject [
	extent := anObject
]

{ #category : #accessing }
SpartaTexture >> format [
	^ format
]

{ #category : #accessing }
SpartaTexture >> format: anObject [
	format := anObject
]
