Class {
	#name : #SkiaEncodedImageFormat,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'ASTC',
		'BMP',
		'DNG',
		'GIF',
		'HEIF',
		'ICO',
		'JPEG',
		'KTX',
		'PKM',
		'PNG',
		'WBMP',
		'WEBP'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> ASTC [
	"This method was automatically generated"
	^ ASTC
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> BMP [
	"This method was automatically generated"
	^ BMP
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> DNG [
	"This method was automatically generated"
	^ DNG
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> GIF [
	"This method was automatically generated"
	^ GIF
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> HEIF [
	"This method was automatically generated"
	^ HEIF
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> ICO [
	"This method was automatically generated"
	^ ICO
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> JPEG [
	"This method was automatically generated"
	^ JPEG
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> KTX [
	"This method was automatically generated"
	^ KTX
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> PKM [
	"This method was automatically generated"
	^ PKM
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> PNG [
	"This method was automatically generated"
	^ PNG
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> WBMP [
	"This method was automatically generated"
	^ WBMP
]

{ #category : #'accessing enum' }
SkiaEncodedImageFormat class >> WEBP [
	"This method was automatically generated"
	^ WEBP
]

{ #category : #'enum declaration' }
SkiaEncodedImageFormat class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
    BMP,
    GIF,
    ICO,
    JPEG,
    PNG,
    WBMP,
    WEBP,
    PKM,
    KTX,
    ASTC,
    DNG,
    HEIF,
)
]

{ #category : #accessing }
SkiaEncodedImageFormat class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaEncodedImageFormat class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaEncodedImageFormat >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_encoded_image_format_to_string(self, GtBoxerString aBoxerString))
]
