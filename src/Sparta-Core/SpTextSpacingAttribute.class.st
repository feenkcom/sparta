Class {
	#name : #SpTextSpacingAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'spacing'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpTextSpacingAttribute class >> spacing: aNumber [
	^ self new
		spacing: aNumber;
		yourself
]

{ #category : #properties }
SpTextSpacingAttribute >> applyOnText: aTextPainter with: aSpan [
	aTextPainter spacing: spacing
]

{ #category : #accessing }
SpTextSpacingAttribute >> spacing [
	^ spacing
]

{ #category : #accessing }
SpTextSpacingAttribute >> spacing: aNumber [

	self
		assert: [ spacing isNil ]
		description: [ 'I am immutable and can not be modified' ].

	spacing := aNumber
]
