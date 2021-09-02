Class {
	#name : 'SkiaColorType',
	#superclass : 'SkiaExternalEnumeration',
	#classVars : [
		'A16Float',
		'A16UNorm',
		'ARGB4444',
		'Alpha8',
		'BGR101010x',
		'BGRA1010102',
		'BGRA8888',
		'Gray8',
		'R16G16B16A16UNorm',
		'R16G16Float',
		'R16G16UNorm',
		'R8G8UNorm',
		'RGB101010x',
		'RGB565',
		'RGB888x',
		'RGBA1010102',
		'RGBA8888',
		'RGBAF16',
		'RGBAF16Norm',
		'RGBAF32',
		'Unknown'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : 'accessing enum' }
SkiaColorType class >> A16Float [
	"This method was automatically generated"
	^ A16Float
]

{ #category : 'accessing enum' }
SkiaColorType class >> A16UNorm [
	"This method was automatically generated"
	^ A16UNorm
]

{ #category : 'accessing enum' }
SkiaColorType class >> ARGB4444 [
	"This method was automatically generated"
	^ ARGB4444
]

{ #category : 'accessing enum' }
SkiaColorType class >> Alpha8 [
	"This method was automatically generated"
	^ Alpha8
]

{ #category : 'accessing enum' }
SkiaColorType class >> BGR101010x [
	"This method was automatically generated"
	^ BGR101010x
]

{ #category : 'accessing enum' }
SkiaColorType class >> BGRA1010102 [
	"This method was automatically generated"
	^ BGRA1010102
]

{ #category : 'accessing enum' }
SkiaColorType class >> BGRA8888 [
	"This method was automatically generated"
	^ BGRA8888
]

{ #category : 'accessing enum' }
SkiaColorType class >> Gray8 [
	"This method was automatically generated"
	^ Gray8
]

{ #category : 'accessing enum' }
SkiaColorType class >> R16G16B16A16UNorm [
	"This method was automatically generated"
	^ R16G16B16A16UNorm
]

{ #category : 'accessing enum' }
SkiaColorType class >> R16G16Float [
	"This method was automatically generated"
	^ R16G16Float
]

{ #category : 'accessing enum' }
SkiaColorType class >> R16G16UNorm [
	"This method was automatically generated"
	^ R16G16UNorm
]

{ #category : 'accessing enum' }
SkiaColorType class >> R8G8UNorm [
	"This method was automatically generated"
	^ R8G8UNorm
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGB101010x [
	"This method was automatically generated"
	^ RGB101010x
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGB565 [
	"This method was automatically generated"
	^ RGB565
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGB888x [
	"This method was automatically generated"
	^ RGB888x
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGBA1010102 [
	"This method was automatically generated"
	^ RGBA1010102
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGBA8888 [
	"This method was automatically generated"
	^ RGBA8888
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGBAF16 [
	"This method was automatically generated"
	^ RGBAF16
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGBAF16Norm [
	"This method was automatically generated"
	^ RGBAF16Norm
]

{ #category : 'accessing enum' }
SkiaColorType class >> RGBAF32 [
	"This method was automatically generated"
	^ RGBAF32
]

{ #category : 'accessing enum' }
SkiaColorType class >> Unknown [
	"This method was automatically generated"
	^ Unknown
]

{ #category : 'enum declaration' }
SkiaColorType class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Unknown,
		Alpha8,
		RGB565,
		ARGB4444,	
		RGBA8888,
		RGB888x,
		BGRA8888,
		RGBA1010102,
		BGRA1010102,
		RGB101010x,
		BGR101010x,
		Gray8,	
		RGBAF16Norm,
		RGBAF16,
		RGBAF32,
		R8G8UNorm,
		A16Float,
		R16G16Float,
		A16UNorm,
		R16G16UNorm,
		R16G16B16A16UNorm,
	)
]

{ #category : 'accessing' }
SkiaColorType class >> externalType [
	^ FFIInt32 new
]

{ #category : 'class initialization' }
SkiaColorType class >> initialize [
	super initialize
]

{ #category : 'private - ffi' }
SkiaColorType >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_color_type_to_string(self, GtBoxerString aBoxerString))
]
