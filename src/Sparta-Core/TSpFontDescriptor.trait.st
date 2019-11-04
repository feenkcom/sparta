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
	^ self subclassResponsibility
]

{ #category : #stretch }
TSpFontDescriptor >> stretchReset [
	^ self subclassResponsibility
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
	^ self subclassResponsibility
]

{ #category : #style }
TSpFontDescriptor >> styleNormal [
	^ self subclassResponsibility
]

{ #category : #style }
TSpFontDescriptor >> styleOblique [
	^ self subclassResponsibility
]

{ #category : #style }
TSpFontDescriptor >> styleReset [
	self subclassResponsibility
]

{ #category : #weight }
TSpFontDescriptor >> weight: aWeight [
	self explicitRequirement
]

{ #category : #weight }
TSpFontDescriptor >> weightBold [
	^ self subclassResponsibility
]

{ #category : #weight }
TSpFontDescriptor >> weightNormal [
	^ self subclassResponsibility
]

{ #category : #weight }
TSpFontDescriptor >> weightReset [
	self subclassResponsibility
]

{ #category : #weight }
TSpFontDescriptor >> weightThin [
	^ self subclassResponsibility
]
