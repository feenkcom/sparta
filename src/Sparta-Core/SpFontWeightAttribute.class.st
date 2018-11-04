Class {
	#name : #SpFontWeightAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'weight'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpFontWeightAttribute class >> bold [
	^ self new
		bold;
		yourself
]

{ #category : #'instance creation' }
SpFontWeightAttribute class >> normal [
	^ self new
		normal;
		yourself
]

{ #category : #'instance creation' }
SpFontWeightAttribute class >> thin [
	^ self new
		thin;
		yourself
]

{ #category : #'instance creation' }
SpFontWeightAttribute class >> weight: aNumber [
	^ self new
		weight: aNumber;
		yourself
]

{ #category : #properties }
SpFontWeightAttribute >> applyOnFont: aFontBuilder with: aSpan [

	weight isNumber
		ifTrue: [ aFontBuilder weight: weight ]
		ifFalse: [ weight isSymbol
			ifTrue: [ aFontBuilder perform: weight ]
			ifFalse: [ self error: 'Unknown weight: ', weight asString ] ]
]

{ #category : #accessing }
SpFontWeightAttribute >> bold [
	weight := #weightBold
]

{ #category : #accessing }
SpFontWeightAttribute >> normal [
	weight := #weightNormal
]

{ #category : #accessing }
SpFontWeightAttribute >> thin [
	weight := #weightThin
]

{ #category : #accessing }
SpFontWeightAttribute >> weight: aNumber [
	weight := aNumber
]
