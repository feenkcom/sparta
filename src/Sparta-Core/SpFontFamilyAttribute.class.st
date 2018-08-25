Class {
	#name : #SpFontFamilyAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'name'
	],
	#category : 'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpFontFamilyAttribute class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #properties }
SpFontFamilyAttribute >> applyOnFont: aFontBuilder with: aSpan [
	aFontBuilder named: name
]

{ #category : #accessing }
SpFontFamilyAttribute >> name: anObject [
	name := anObject
]
