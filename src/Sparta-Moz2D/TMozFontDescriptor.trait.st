"
I implement typical font configuration methods
"
Trait {
	#name : #TMozFontDescriptor,
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #stretch }
TMozFontDescriptor >> stretchCondensed [
	self stretch: MozTextFontStretch CONDENSED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchExpanded [
	self stretch: MozTextFontStretch EXPANDED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchExtraCondensed [
	self stretch: MozTextFontStretch EXTRA_CONDENSED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchExtraExpanded [
	self stretch: MozTextFontStretch EXTRA_EXPANDED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchNormal [
	self stretch: MozTextFontStretch NORMAL
]

{ #category : #stretch }
TMozFontDescriptor >> stretchSemiCondensed [
	self stretch: MozTextFontStretch SEMI_CONDENSED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchSemiExpanded [
	self stretch: MozTextFontStretch SEMI_EXPANDED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchUltraCondensed [
	self stretch: MozTextFontStretch ULTRA_CONDENSED
]

{ #category : #stretch }
TMozFontDescriptor >> stretchUltraExpanded [
	self stretch: MozTextFontStretch ULTRA_EXPANDED
]

{ #category : #style }
TMozFontDescriptor >> styleItalic [
	self style: self style | MozTextFontStyle ITALIC value
]

{ #category : #style }
TMozFontDescriptor >> styleNormal [
	"Normal style resets style"
	self style: MozTextFontStyle NORMAL value
]

{ #category : #style }
TMozFontDescriptor >> styleOblique [
	self style: self style | MozTextFontStyle OBLIQUE value
]

{ #category : #weight }
TMozFontDescriptor >> weightBold [
	self weight: MozTextFontWeight BOLD
]

{ #category : #weight }
TMozFontDescriptor >> weightNormal [
	self weight: MozTextFontWeight NORMAL
]

{ #category : #weight }
TMozFontDescriptor >> weightThin [
	self weight: MozTextFontWeight THIN
]
