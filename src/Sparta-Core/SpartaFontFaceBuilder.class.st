Class {
	#name : #SpartaFontFaceBuilder,
	#superclass : #SpartaAbstractBuilder,
	#traits : 'TSpFontDescriptor',
	#classTraits : 'TSpFontDescriptor classTrait',
	#instVars : [
		'familyName',
		'source',
		'stretch',
		'style',
		'weight',
		'unicodeRange'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #building }
SpartaFontFaceBuilder >> build [
	self subclassResponsibility
]

{ #category : #accessing }
SpartaFontFaceBuilder >> familyName [
	^ familyName
]

{ #category : #accessing }
SpartaFontFaceBuilder >> familyName: anObject [
	familyName := anObject
]

{ #category : #initialization }
SpartaFontFaceBuilder >> initialize [
	super initialize.
	
	self styleNormal.
	self weightNormal.
	self stretchNormal.
	
	unicodeRange := nil "range is not defined"
]

{ #category : #'initialize-release' }
SpartaFontFaceBuilder >> reset [
	super reset.
	
	familyName := nil.
	source := nil.
	unicodeRange := nil.
	
	self styleNormal.
	self weightNormal.
	self stretchNormal.
]

{ #category : #accessing }
SpartaFontFaceBuilder >> source [
	^ source
]

{ #category : #accessing }
SpartaFontFaceBuilder >> source: anObject [
	source := anObject
]

{ #category : #accessing }
SpartaFontFaceBuilder >> stretch [
	<return: #SpartaFontStretch>

	^ stretch
]

{ #category : #accessing }
SpartaFontFaceBuilder >> stretch: aSpartaFontStretch [
	stretch := aSpartaFontStretch
]

{ #category : #accessing }
SpartaFontFaceBuilder >> style [
	<return: #SpartaFontSlant>

	^ style
]

{ #category : #accessing }
SpartaFontFaceBuilder >> style: aSpartaFontSlant [
	style := aSpartaFontSlant
]

{ #category : #accessing }
SpartaFontFaceBuilder >> unicodeRange [
	^ unicodeRange
]

{ #category : #accessing }
SpartaFontFaceBuilder >> unicodeRange: aString [
	"Example:
	
	range: 'U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215'
	
	"

	unicodeRange := aString
]

{ #category : #accessing }
SpartaFontFaceBuilder >> weight [
	<return: #SpartaFontWeight>

	^ weight
]

{ #category : #weight }
SpartaFontFaceBuilder >> weight: aSpartaFontWeight [
	weight := aSpartaFontWeight
]
