Class {
	#name : #SkiaColor,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaColor class >> argb: aNumber [
	^ self fromNativeHandle: (self primCreateArgb: aNumber)
]

{ #category : #'instance creation' }
SkiaColor class >> argb: aNumber during: aBlock [
	^ self fromNativeHandle: (self primCreateArgb: aNumber) during: aBlock
]

{ #category : #'instance creation' }
SkiaColor class >> fromColor: aColor [
	^ self argb: (aColor pixelValueForDepth: 32)
]

{ #category : #'instance creation' }
SkiaColor class >> fromColor: aColor during: aBlock [
	^ self argb: (aColor pixelValueForDepth: 32) during: aBlock
]

{ #category : #'private - ffi' }
SkiaColor class >> primCreate [
	^ self ffiCall: #(void* skia_color_default())
]

{ #category : #'private - ffi' }
SkiaColor class >> primCreateArgb: aNumber [
	^ self ffiCall: #(void* skia_color_create_argb(uint32 aNumber))
]

{ #category : #'private - ffi' }
SkiaColor class >> primCreateR: aRed g: aGreen b: aBlue a: anAlpha [
	^ self ffiCall: #(void* skia_color_create(
		uint8 aRed,
		uint8 aGreen,
		uint8 aBlue,
		uint8 anAlpha))
]

{ #category : #'private - ffi' }
SkiaColor class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_color_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaColor class >> r: aRed g: aGreen b: aBlue a: anAlpha [
	"All color channel values are [0..255]"
	
	^ self fromNativeHandle: (self primCreateR: aRed g: aGreen b: aBlue a: anAlpha)
]

{ #category : #accessing }
SkiaColor >> alpha [
	^ self primGetAlpha
]

{ #category : #accessing }
SkiaColor >> asColor [
	<return: #Color>

	^ (Color r: self red g: self green b: self blue range: 255) alpha: self alpha / 255.0
]

{ #category : #accessing }
SkiaColor >> blue [
	^ self primGetBlue
]

{ #category : #accessing }
SkiaColor >> green [
	^ self primGetGreen
]

{ #category : #'gt-extension' }
SkiaColor >> gtColorFor: aView [
	<gtView>

	^ (self asColor gtPreviewFor: aView)
		title: 'Color';
		priority: 1
]

{ #category : #'gt-extension' }
SkiaColor >> gtInfoFor: aView [
	<gtView>

	^ ({ 
		#red -> self red.
		#green -> self green.
		#blue -> self blue.
		#alpha -> self alpha.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'private - ffi' }
SkiaColor >> primGetAlpha [
	^ self ffiCall: #(uint8 skia_color_get_alpha(self))
]

{ #category : #'private - ffi' }
SkiaColor >> primGetBlue [
	^ self ffiCall: #(uint8 skia_color_get_blue(self))
]

{ #category : #'private - ffi' }
SkiaColor >> primGetGreen [
	^ self ffiCall: #(uint8 skia_color_get_green(self))
]

{ #category : #'private - ffi' }
SkiaColor >> primGetRed [
	^ self ffiCall: #(uint8 skia_color_get_red(self))
]

{ #category : #printing }
SkiaColor >> printOn: aStream [
	aStream print: self asColor
]

{ #category : #accessing }
SkiaColor >> red [
	^ self primGetRed
]
