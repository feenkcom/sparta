Class {
	#name : #SkiaBlendMode,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Clear',
		'Color',
		'ColorBurn',
		'ColorDodge',
		'Darken',
		'Difference',
		'Dst',
		'DstATop',
		'DstIn',
		'DstOut',
		'DstOver',
		'Exclusion',
		'HardLight',
		'Hue',
		'Lighten',
		'Luminosity',
		'Modulate',
		'Multiply',
		'Overlay',
		'Plus',
		'Saturation',
		'Screen',
		'SoftLight',
		'Src',
		'SrcATop',
		'SrcIn',
		'SrcOut',
		'SrcOver',
		'Xor'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaBlendMode class >> Clear [
	"This method was automatically generated"
	^ Clear
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Color [
	"This method was automatically generated"
	^ Color
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> ColorBurn [
	"This method was automatically generated"
	^ ColorBurn
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> ColorDodge [
	"This method was automatically generated"
	^ ColorDodge
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Darken [
	"This method was automatically generated"
	^ Darken
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Difference [
	"This method was automatically generated"
	^ Difference
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Dst [
	"This method was automatically generated"
	^ Dst
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> DstATop [
	"This method was automatically generated"
	^ DstATop
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> DstIn [
	"This method was automatically generated"
	^ DstIn
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> DstOut [
	"This method was automatically generated"
	^ DstOut
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> DstOver [
	"This method was automatically generated"
	^ DstOver
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Exclusion [
	"This method was automatically generated"
	^ Exclusion
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> HardLight [
	"This method was automatically generated"
	^ HardLight
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Hue [
	"This method was automatically generated"
	^ Hue
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Lighten [
	"This method was automatically generated"
	^ Lighten
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Luminosity [
	"This method was automatically generated"
	^ Luminosity
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Modulate [
	"This method was automatically generated"
	^ Modulate
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Multiply [
	"This method was automatically generated"
	^ Multiply
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Overlay [
	"This method was automatically generated"
	^ Overlay
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Plus [
	"This method was automatically generated"
	^ Plus
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Saturation [
	"This method was automatically generated"
	^ Saturation
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Screen [
	"This method was automatically generated"
	^ Screen
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> SoftLight [
	"This method was automatically generated"
	^ SoftLight
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Src [
	"This method was automatically generated"
	^ Src
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> SrcATop [
	"This method was automatically generated"
	^ SrcATop
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> SrcIn [
	"This method was automatically generated"
	^ SrcIn
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> SrcOut [
	"This method was automatically generated"
	^ SrcOut
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> SrcOver [
	"This method was automatically generated"
	^ SrcOver
]

{ #category : #'accessing enum' }
SkiaBlendMode class >> Xor [
	"This method was automatically generated"
	^ Xor
]

{ #category : #'enum declaration' }
SkiaBlendMode class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Clear,
		Src,
		Dst,
		SrcOver,
		DstOver,
		SrcIn,
		DstIn,
		SrcOut,
		DstOut,
		SrcATop,
		DstATop,
		Xor,
		Plus,
		Modulate,
		Screen,
		Overlay,
		Darken,
		Lighten,
		ColorDodge,
		ColorBurn,
		HardLight,
		SoftLight,
		Difference,
		Exclusion,
		Multiply,
		Hue,
		Saturation,
		Color,
		Luminosity,
	)
]

{ #category : #accessing }
SkiaBlendMode class >> externalType [
	^ FFIInt32 new
]

{ #category : #'private - ffi' }
SkiaBlendMode >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_blend_mode_to_string(self, GtBoxerString aBoxerString))
]

{ #category : #'private - ffi' }
SkiaBlendMode >> primRealValue [
	^ self ffiCall: #(int32 skia_blend_mode_to_int(self))
]
