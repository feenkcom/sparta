Class {
	#name : #SkiaTextRun,
	#superclass : #Object,
	#traits : 'TSpTextRun',
	#classTraits : 'TSpTextRun classTrait',
	#instVars : [
		'boxerString',
		'buffer',
		'textBlob'
	],
	#category : #'Sparta-Skia-Text'
}

{ #category : #'instance creation' }
SkiaTextRun class >> fromString: aString [
	^ self fromString: aString font: SkiaFont new
]

{ #category : #'instance creation' }
SkiaTextRun class >> fromString: aString font: aFont [
	^ self new initializeWith: aString font: aFont
]

{ #category : #accessing }
SkiaTextRun >> characters [
	<return: #GtBoxerString>

	^ boxerString
]

{ #category : #initialization }
SkiaTextRun >> initializeWith: aString font: aFont [
	boxerString := GtBoxerString fromString: aString.
	buffer := boxerString asArray asByteArray.
	textBlob := SkiaTextBlob text: boxerString font: aFont
]

{ #category : #testing }
SkiaTextRun >> isNull [
	<return: #Boolean>

	^ boxerString isNull
]

{ #category : #accessing }
SkiaTextRun >> length [
	"Return how many characters (not glyphs) are behind this text run"
	<return: #Number>
	
	^ boxerString size
]

{ #category : #accessing }
SkiaTextRun >> size [
	"Return a number of glyphs that build this text.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code"
	<return: #Number>
	
	^ boxerString length
]

{ #category : #accessing }
SkiaTextRun >> textBlob [
	<return: #SkiaTextBlob>

	^ textBlob
]
