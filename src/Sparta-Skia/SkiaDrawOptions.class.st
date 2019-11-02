Class {
	#name : #SkiaDrawOptions,
	#superclass : #Object,
	#traits : 'TSpartaDrawOptions',
	#classTraits : 'TSpartaDrawOptions classTrait',
	#instVars : [
		'alpha',
		'blendMode',
		'antialias'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #cleanup }
SkiaDrawOptions class >> cleanUp [
	default := nil
]

{ #category : #accessing }
SkiaDrawOptions class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #accessing }
SkiaDrawOptions >> alpha [
	^ alpha
]

{ #category : #accessing }
SkiaDrawOptions >> alpha: aFloat [
	alpha := aFloat
]

{ #category : #accessing }
SkiaDrawOptions >> antialias [
	<return: #Boolean>

	^ antialias
]

{ #category : #'antialias modes' }
SkiaDrawOptions >> antialiasDefault [
	antialias := true
]

{ #category : #'antialias modes' }
SkiaDrawOptions >> antialiasGray [
	antialias := true
]

{ #category : #'antialias modes' }
SkiaDrawOptions >> antialiasNone [
	antialias := false
]

{ #category : #'antialias modes' }
SkiaDrawOptions >> antialiasSubpixel [
	antialias := true
]

{ #category : #accessing }
SkiaDrawOptions >> blendMode [
	<return: #SkiaBlendMode>

	^ blendMode
]

{ #category : #accessing }
SkiaDrawOptions >> blendMode: aSkiaBlendMode [
	blendMode := aSkiaBlendMode
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeAdd [
	self blendMode: SkiaBlendMode Plus
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeAtop [
	self blendMode: SkiaBlendMode SrcATop
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeClear [
	self blendMode: SkiaBlendMode Clear
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeColor [
	self blendMode: SkiaBlendMode Color
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeColorBurn [
	self blendMode: SkiaBlendMode ColorBurn
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeColorDodge [
	self blendMode: SkiaBlendMode ColorDodge
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeDarken [
	self blendMode: SkiaBlendMode Darken
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeDestAtop [
	self blendMode: SkiaBlendMode DstATop
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeDestIn [
	self blendMode: SkiaBlendMode DstIn
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeDestOut [
	self blendMode: SkiaBlendMode DstOut
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeDestOver [
	self blendMode: SkiaBlendMode DstOver
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeDifference [
	self blendMode: SkiaBlendMode Difference
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeExclusion [
	self blendMode: SkiaBlendMode Exclusion
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeHardLight [
	self blendMode: SkiaBlendMode HardLight
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeHue [
	self blendMode: SkiaBlendMode Hue
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeIn [
	self blendMode: SkiaBlendMode SrcIn
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeLighten [
	self blendMode: SkiaBlendMode Lighten
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeLuminosity [
	self blendMode: SkiaBlendMode Luminosity
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeMultiply [
	self blendMode: SkiaBlendMode Multiply
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeOut [
	self blendMode: SkiaBlendMode SrcOut
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeOver [
	self blendMode: SkiaBlendMode SrcOver
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeOverlay [
	self blendMode: SkiaBlendMode Overlay
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeSaturation [
	self blendMode: SkiaBlendMode Saturation
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeScreen [
	self blendMode: SkiaBlendMode Screen
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeSoftLight [
	self blendMode: SkiaBlendMode SoftLight
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeSource [
	self blendMode: SkiaBlendMode Src
]

{ #category : #'composition operators' }
SkiaDrawOptions >> composeXor [
	self blendMode: SkiaBlendMode Xor
]

{ #category : #initialization }
SkiaDrawOptions >> initialize [
	super initialize.

	"Setting default values"
	self alpha: 1.
	self antialiasDefault.
	self composeOver
]
