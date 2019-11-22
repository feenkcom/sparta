"
I am a helper trait that defines basic font properties such as weight, style and stretch
"
Trait {
	#name : #TSpFontDescriptor,
	#instVars : [
		'stretch',
		'style',
		'weight'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #stretch }
TSpFontDescriptor >> stretch [
	^ stretch
]

{ #category : #stretch }
TSpFontDescriptor >> stretch: aNumber [
	stretch := aNumber value
]

{ #category : #stretch }
TSpFontDescriptor >> stretchCondensed [
	self stretch: SpartaFontStretch condensed
]

{ #category : #stretch }
TSpFontDescriptor >> stretchExpanded [
	self stretch: SpartaFontStretch expanded
]

{ #category : #stretch }
TSpFontDescriptor >> stretchExtraCondensed [
	self stretch: SpartaFontStretch extraCondensed
]

{ #category : #stretch }
TSpFontDescriptor >> stretchExtraExpanded [
	self stretch: SpartaFontStretch extraExpanded
]

{ #category : #stretch }
TSpFontDescriptor >> stretchNormal [
	self stretch: SpartaFontStretch normal
]

{ #category : #stretch }
TSpFontDescriptor >> stretchReset [
	self stretchNormal
]

{ #category : #stretch }
TSpFontDescriptor >> stretchSemiCondensed [
	self stretch: SpartaFontStretch semiCondensed
]

{ #category : #stretch }
TSpFontDescriptor >> stretchSemiExpanded [
	self stretch: SpartaFontStretch semiExpanded
]

{ #category : #stretch }
TSpFontDescriptor >> stretchUltraCondensed [
	self stretch: SpartaFontStretch ultraCondensed
]

{ #category : #stretch }
TSpFontDescriptor >> stretchUltraExpanded [
	self stretch: SpartaFontStretch ultraExpanded
]

{ #category : #style }
TSpFontDescriptor >> style [
	<return: #SpartaFontSlant>

	^ style
]

{ #category : #style }
TSpFontDescriptor >> style: aSpartaFontSlantOrNumber [
	style := aSpartaFontSlantOrNumber isNumber
		ifTrue: [ SpartaFontSlant fromNumber: aSpartaFontSlantOrNumber ]
		ifFalse: [ aSpartaFontSlantOrNumber ]
]

{ #category : #style }
TSpFontDescriptor >> styleItalic [
	self style: SpartaFontSlant italic
]

{ #category : #style }
TSpFontDescriptor >> styleNormal [
	self style: SpartaFontSlant normal
]

{ #category : #style }
TSpFontDescriptor >> styleOblique [
	self style: SpartaFontSlant oblique
]

{ #category : #style }
TSpFontDescriptor >> styleReset [
	self styleNormal
]

{ #category : #weight }
TSpFontDescriptor >> weight [
	<return: #SpartaFontWeight>

	^ weight
]

{ #category : #weight }
TSpFontDescriptor >> weight: aSpartaFontWeightOrNumber [
	weight := aSpartaFontWeightOrNumber isNumber
		ifTrue: [ SpartaFontWeight fromNumber: aSpartaFontWeightOrNumber ]
		ifFalse: [ aSpartaFontWeightOrNumber ]
]

{ #category : #weight }
TSpFontDescriptor >> weightBlack [
	self weight: SpartaFontWeight black
]

{ #category : #weight }
TSpFontDescriptor >> weightBold [
	self weight: SpartaFontWeight bold
]

{ #category : #weight }
TSpFontDescriptor >> weightExtraBlack [
	self weight: SpartaFontWeight extraBlack
]

{ #category : #weight }
TSpFontDescriptor >> weightExtraBold [
	self weight: SpartaFontWeight extraBold
]

{ #category : #weight }
TSpFontDescriptor >> weightExtraLight [
	self weight: SpartaFontWeight extraLight
]

{ #category : #weight }
TSpFontDescriptor >> weightLight [
	self weight: SpartaFontWeight light
]

{ #category : #weight }
TSpFontDescriptor >> weightMedium [
	self weight: SpartaFontWeight medium
]

{ #category : #weight }
TSpFontDescriptor >> weightNormal [
	self weight: SpartaFontWeight normal
]

{ #category : #weight }
TSpFontDescriptor >> weightReset [
	self weightNormal
]

{ #category : #weight }
TSpFontDescriptor >> weightSemiBold [
	self weight: SpartaFontWeight semiBold
]

{ #category : #weight }
TSpFontDescriptor >> weightThin [
	self weight: SpartaFontWeight thin
]
