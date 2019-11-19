"
I define an API of a Text run - an object that holds an array of glyphs that represent a piece of text.

Note that TextRun is optimised for the case of simple ASCII string (all chars are 8 bit), simple multilanguage string (all chars are 16 bit) and complex scripts (characters have various length of 8-32 bits).

Users should never instantiate TextRun directly, instead ask TextPainter to do the necessary job - it is needed to support backend specific text runs
"
Trait {
	#name : #TSpTextRun,
	#category : #'Sparta-Core-Text'
}

{ #category : #'external resource management' }
TSpTextRun >> autoRelease [
]

{ #category : #testing }
TSpTextRun >> isEmpty [
	^ self length isZero
]

{ #category : #testing }
TSpTextRun >> isNotEmpty [
	^ self isEmpty not
]

{ #category : #testing }
TSpTextRun >> isNull [
	<return: #Boolean>

	^ self explicitRequirement
]

{ #category : #accessing }
TSpTextRun >> size [
	"Return a number of glyphs that build this text.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code"
	<return: #Number>
	
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpTextRun >> spartaFillOn: aSpartaCanvas with: aTextPainter [
	aTextPainter fillTextRun: self
]
