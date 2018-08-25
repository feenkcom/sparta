Class {
	#name : #SpFontGenericFamilyAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'family'
	],
	#category : 'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpFontGenericFamilyAttribute class >> monospace [
	^ self new
		monospace;
		yourself
]

{ #category : #properties }
SpFontGenericFamilyAttribute >> applyOnFont: aFontBuilder with: aSpan [
	aFontBuilder perform: family
]

{ #category : #accessing }
SpFontGenericFamilyAttribute >> monospace [
	family := #monospace
]

{ #category : #accessing }
SpFontGenericFamilyAttribute >> sansSerif [
	family := #sansSerif
]
