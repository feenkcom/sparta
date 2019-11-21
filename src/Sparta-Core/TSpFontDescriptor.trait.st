"
I am a helper trait that defines basic font properties such as weight, style and stretch
"
Trait {
	#name : #TSpFontDescriptor,
	#category : #'Sparta-Core-Text'
}

{ #category : #stretch }
TSpFontDescriptor >> stretchCondensed [
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchExpanded [
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchExtraCondensed [
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchExtraExpanded [
	^ self subclassResponsibility
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
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchSemiExpanded [
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchUltraCondensed [
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchUltraExpanded [
	^ self subclassResponsibility
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
TSpFontDescriptor >> weight: aSpartaFontWeight [
	self explicitRequirement
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
