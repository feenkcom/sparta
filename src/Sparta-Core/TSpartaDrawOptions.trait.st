"
I declare an API that backend specific draw options mut provide.
A draw options control how the incoming color (source) will be transferred to surface (destination).
"
Trait {
	#name : #TSpartaDrawOptions,
	#category : 'Sparta-Core'
}

{ #category : #accessing }
TSpartaDrawOptions classSide >> default [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDrawOptions >> alpha: aFloat [
	self explicitRequirement
]

{ #category : #'antialias modes' }
TSpartaDrawOptions >> antialiasDefault [
	self explicitRequirement
]

{ #category : #'antialias modes' }
TSpartaDrawOptions >> antialiasGray [
	self explicitRequirement
]

{ #category : #'antialias modes' }
TSpartaDrawOptions >> antialiasNone [
	self explicitRequirement
]

{ #category : #'antialias modes' }
TSpartaDrawOptions >> antialiasSubpixel [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeAdd [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeAtop [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeClear [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeColor [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeColorBurn [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeColorDodge [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeDarken [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeDestAtop [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeDestIn [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeDestOut [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeDestOver [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeDifference [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeExclusion [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeHardLight [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeHue [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeIn [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeLighten [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeLuminosity [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeMultiply [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeOut [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeOver [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeOverlay [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeSaturation [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeScreen [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeSoftLight [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeSource [
	self explicitRequirement
]

{ #category : #'composition operators' }
TSpartaDrawOptions >> composeXor [
	self explicitRequirement
]
