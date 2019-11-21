Class {
	#name : #SpartaUserFonts,
	#superclass : #Object,
	#instVars : [
		'fontFaces'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaUserFonts class >> cleanUp [
	default := nil
]

{ #category : #accessing }
SpartaUserFonts class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #adding }
SpartaUserFonts >> addUserFontFace: aSpartaUserFontFace [
	fontFaces add: aSpartaUserFontFace
]

{ #category : #initialization }
SpartaUserFonts >> initialize [
	super initialize.
	
	fontFaces := Set new
]

{ #category : #private }
SpartaUserFonts >> matchFamilyName: aFamilyName weight: aWeight stretch: aFontStyleStretch slant: aFontStyleSlant ifFound: aFoundBlock ifNone: aNotFoundBlock [
	| theFontFaces matchingWeightAndStyle |

	theFontFaces := fontFaces select: [ :eachFontFace | eachFontFace familyName = aFamilyName ].
	
	matchingWeightAndStyle := theFontFaces select: [ :eachFontFace |
		eachFontFace weight = aWeight
			and: [ eachFontFace style = aFontStyleSlant ] ].
		
	matchingWeightAndStyle
		detect: [ :eachFontFace | eachFontFace stretch = aFontStyleStretch ]
		ifFound: [ :eachFontFace | ^ aFoundBlock value: eachFontFace ].
		
	matchingWeightAndStyle
		ifNotEmpty: [ ^ aFoundBlock value: matchingWeightAndStyle anyOne ].
		
	theFontFaces
		detect: [ :eachFontFace | eachFontFace style = aFontStyleSlant ]
		ifFound: [ :eachFontFace | ^ aFoundBlock value: eachFontFace ].
		
	theFontFaces
		detect: [ :eachFontFace | eachFontFace weight = aWeight ]
		ifFound: [ :eachFontFace | ^ aFoundBlock value: eachFontFace ].
		
	^ aNotFoundBlock value
]

{ #category : #accessing }
SpartaUserFonts >> matchFontFace: aSpartaFontFace ifFound: aFoundBlock ifNone: aNotFoundBlock [
	^ self
		matchFamilyName: aSpartaFontFace familyName
		weight: aSpartaFontFace weight
		stretch: aSpartaFontFace stretch
		slant: aSpartaFontFace style
		ifFound: aFoundBlock
		ifNone: aNotFoundBlock
]
