Class {
	#name : #SkiaPixelGeometry,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'BGRH',
		'BGRV',
		'RGBH',
		'RGBV',
		'Unknown'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaPixelGeometry class >> BGRH [
	"This method was automatically generated"
	^ BGRH
]

{ #category : #'accessing enum' }
SkiaPixelGeometry class >> BGRV [
	"This method was automatically generated"
	^ BGRV
]

{ #category : #'accessing enum' }
SkiaPixelGeometry class >> RGBH [
	"This method was automatically generated"
	^ RGBH
]

{ #category : #'accessing enum' }
SkiaPixelGeometry class >> RGBV [
	"This method was automatically generated"
	^ RGBV
]

{ #category : #'accessing enum' }
SkiaPixelGeometry class >> Unknown [
	"This method was automatically generated"
	^ Unknown
]

{ #category : #'enum declaration' }
SkiaPixelGeometry class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Unknown,
		RGBH,
		BGRH,
		RGBV,
		BGRV,
	)
]

{ #category : #accessing }
SkiaPixelGeometry class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaPixelGeometry class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaPixelGeometry >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_pixel_geometry_to_string(self, GtBoxerString aBoxerString))
]
