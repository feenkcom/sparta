Class {
	#name : #SpartaUserFontFace,
	#superclass : #SpartaFontFace,
	#instVars : [
		'source'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaUserFontFace >> source [
	^ source
]

{ #category : #accessing }
SpartaUserFontFace >> source: anObject [
	source := anObject asSpartaFontSource
]
