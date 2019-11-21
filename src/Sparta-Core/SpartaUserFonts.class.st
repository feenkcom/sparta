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
SpartaUserFonts >> matchFamilyName: aFamilyName weight: aFontStyleWeight stretch: aFontStyleStretch slant: aFontStyleSlant ifFound: aFoundBlock ifNone: aNotFoundBlock [
	| theFontFaces matchingWeightAndStyle matchingStyle matchingWeight |

	theFontFaces := fontFaces select: [ :eachFontFace | eachFontFace familyName = aFamilyName ].
	theFontFaces ifEmpty: [ ^ aNotFoundBlock value ].
	
	matchingWeightAndStyle := theFontFaces select: [ :eachFontFace |
		eachFontFace weight = aFontStyleWeight
			and: [ eachFontFace style = aFontStyleSlant ] ].

	"stretch is not that much important, so we check it first"		
	matchingWeightAndStyle
		detect: [ :eachFontFace | eachFontFace stretch = aFontStyleStretch ]
		ifFound: [ :eachFontFace | ^ aFoundBlock value: eachFontFace ].
		
	"if there are multiple fonts matching weight and style return any one for now"
	matchingWeightAndStyle
		ifNotEmpty: [ ^ aFoundBlock value: matchingWeightAndStyle anyOne ].

	"at this point we know that there is no font face that matches weight and style"
	matchingStyle := theFontFaces select: [ :eachFontFace | eachFontFace style = aFontStyleSlant ].
	matchingWeight := theFontFaces select: [ :eachFontFace | eachFontFace weight = aFontStyleWeight ].

	"style is more important than precise weight"
	matchingStyle ifNotEmpty: [
		"we should find a font face with as close weight as possible"
		^ matchingStyle detectMin: [ :eachFontFace | (eachFontFace weight value - aFontStyleWeight value) abs ] ].

	"no corresponding style found, let's match weight first"
	matchingWeight ifNotEmpty: [
		"we should find a font face with as close style as possible"
		^ matchingWeight detectMin: [ :eachFontFace | (eachFontFace style value - aFontStyleSlant value) abs ] ].

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
