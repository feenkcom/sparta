Class {
	#name : #SpartaCairoFreetypeFontBuilder,
	#superclass : #SpartaFontBuilder,
	#instVars : [
		'fontList'
	],
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #accessing }
SpartaCairoFreetypeFontBuilder >> build [
	| aFamilyName theFallbackFonts aLogicalFont |
	
	aFamilyName := (fontList isNil or: [ fontList isEmpty ])
		ifTrue: [ StandardFonts defaultFont familyName ]
		ifFalse: [ fontList first ].

	theFallbackFonts := fontList ifNotNil: [
		fontList
			ifEmpty: [ nil ]
			ifNotEmpty: [ fontList allButFirst ] ].
	
	aLogicalFont := LogicalFont
		familyName: aFamilyName
		fallbackFamilyNames: theFallbackFonts
		pointSize: size
		stretchValue: stretch value
		weightValue: weight value
		slantValue: style value.
		
	^ SpartaCairoFreetypeFontFace create: aLogicalFont asFreetypeFont
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> cursive [
	SpartaUnsupported signal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> fantasy [
	SpartaUnsupported signal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> fixed [
	SpartaUnsupported signal
]

{ #category : #private }
SpartaCairoFreetypeFontBuilder >> fontListAdd: aFontName [

	fontList ifNil: [ fontList := OrderedCollection new ].
	fontList add: aFontName
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> monospace [
	SpartaUnsupported signal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> named: aNameString [
	self fontListAdd: aNameString
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> sansSerif [
	SpartaUnsupported signal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> serif [
	SpartaUnsupported signal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> special [
	SpartaUnsupported signal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> variable [
	SpartaUnsupported signal
]
