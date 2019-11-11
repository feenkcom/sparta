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
		stretchValue: stretch
		weightValue: weight
		slantValue: style.
		
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

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchCondensed [
	self stretch: LogicalFont stretchCondensed
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchExpanded [
	self stretch: LogicalFont stretchExpanded
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchExtraCondensed [
	self stretch: LogicalFont stretchExtraCondensed
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchExtraExpanded [
	self stretch: LogicalFont stretchExtraExpanded
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchNormal [
	self stretch: LogicalFont stretchRegular
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchReset [
	self stretchNormal
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchSemiCondensed [
	self stretch: LogicalFont stretchSemiCondensed
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchSemiExpanded [
	self stretch: LogicalFont stretchSemiExpanded
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchUltraCondensed [
	self stretch: LogicalFont stretchUltraCondensed
]

{ #category : #stretch }
SpartaCairoFreetypeFontBuilder >> stretchUltraExpanded [
	self stretch: LogicalFont stretchUltraExpanded
]

{ #category : #style }
SpartaCairoFreetypeFontBuilder >> styleItalic [
	self style: self style | LogicalFont slantItalic
]

{ #category : #style }
SpartaCairoFreetypeFontBuilder >> styleNormal [
	self style: LogicalFont slantNormal
]

{ #category : #style }
SpartaCairoFreetypeFontBuilder >> styleOblique [
	self style: self style | LogicalFont slantOblique
]

{ #category : #style }
SpartaCairoFreetypeFontBuilder >> styleReset [
	self styleNormal
]

{ #category : #'instance creation' }
SpartaCairoFreetypeFontBuilder >> variable [
	SpartaUnsupported signal
]
