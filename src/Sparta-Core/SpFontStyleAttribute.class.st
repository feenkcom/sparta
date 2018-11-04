Class {
	#name : #SpFontStyleAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'style'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpFontStyleAttribute class >> bold [
	^ self new
		bold;
		yourself
]

{ #category : #'instance creation' }
SpFontStyleAttribute class >> italic [
	^ self new
		italic;
		yourself
]

{ #category : #'instance creation' }
SpFontStyleAttribute class >> normal [
	^ self new
		normal;
		yourself
]

{ #category : #'instance creation' }
SpFontStyleAttribute class >> oblique [
	^ self new
		oblique;
		yourself
]

{ #category : #properties }
SpFontStyleAttribute >> applyOnFont: aFontBuilder with: aSpan [
	aFontBuilder perform: style
]

{ #category : #styles }
SpFontStyleAttribute >> bold [
	style := #weightBold
]

{ #category : #styles }
SpFontStyleAttribute >> italic [
	style := #styleItalic
]

{ #category : #styles }
SpFontStyleAttribute >> normal [
	style := #styleNormal
]

{ #category : #styles }
SpFontStyleAttribute >> oblique [
	style := #styleOblique
]
