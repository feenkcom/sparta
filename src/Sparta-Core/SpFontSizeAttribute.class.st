Class {
	#name : #SpFontSizeAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'size'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpFontSizeAttribute class >> size: aNumber [
	^ self new
		size: aNumber;
		yourself
]

{ #category : #properties }
SpFontSizeAttribute >> applyOnFont: aFontBuilder with: aSpan [
	aFontBuilder size: size
]

{ #category : #accessing }
SpFontSizeAttribute >> size: aNumber [
	size := aNumber
]
