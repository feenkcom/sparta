Class {
	#name : #SpTextWrapAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'wrapType'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpTextWrapAttribute class >> none [
	^ self new
		none;
		yourself
]

{ #category : #'instance creation' }
SpTextWrapAttribute class >> normal [
	^ self new
		normal;
		yourself
]

{ #category : #'instance creation' }
SpTextWrapAttribute class >> wordWrap [
	^ self new
		wordWrap;
		yourself
]

{ #category : #properties }
SpTextWrapAttribute >> applyOnText: aTextPainter with: aSpan [
	aTextPainter perform: wrapType
]

{ #category : #'break types' }
SpTextWrapAttribute >> none [
	wrapType := #breakNone
]

{ #category : #'break types' }
SpTextWrapAttribute >> normal [
	wrapType := #breakNormal
]

{ #category : #'break types' }
SpTextWrapAttribute >> wordWrap [
	wrapType := #breakWordWrap
]
