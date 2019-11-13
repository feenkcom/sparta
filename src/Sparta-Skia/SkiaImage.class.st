Class {
	#name : #SkiaImage,
	#superclass : #SkiaExternalObject,
	#traits : 'TSpartaSurface',
	#classTraits : 'TSpartaSurface classTrait',
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaImage class >> fromForm: aForm [
	| aForm32 theBits aGtBoxerArrayU8 blueIndex greenIndex redIndex alphaIndex alpha red green blue anImage |
	
	aForm32 := aForm unhibernate; asFormOfDepth: 32.
	theBits := aForm32 bits asByteArray.
		
	aGtBoxerArrayU8 := GtBoxerArrayU8 new: theBits size withAll: 0.
	
	"We should convert ARGB to RGBA"	
	1 to: theBits size // 4 do: [ :index |
		blueIndex := 4 * index.
		greenIndex := blueIndex - 1.
		redIndex := greenIndex - 1.
		alphaIndex := redIndex - 1.
		
		"read ARGB"
		alpha := theBits at: alphaIndex.
		red := theBits at: redIndex.
		green := theBits at: greenIndex.
		blue := theBits at: blueIndex.
		
		"write RGBA"
		aGtBoxerArrayU8 at: alphaIndex put: red.
		aGtBoxerArrayU8 at: redIndex put: green.
		aGtBoxerArrayU8 at: greenIndex put: blue.
		aGtBoxerArrayU8 at: blueIndex put: alpha ].
	
	anImage := self fromNativeHandle: (self
		primFromPixels: aGtBoxerArrayU8
		width: aForm32 width
		height: aForm32 height
		rowBytes: theBits size // aForm32 height
		colorType: SkiaColorType RGBA8888).
		
	^ anImage
]

{ #category : #'private - ffi' }
SkiaImage class >> primFromPixels: aGtBoxerArrayU8 width: aWidth height: aHeight rowBytes: anAmountOfBytesPerRow colorType: aColorType [
	^ self ffiCall: #(void* skia_image_from_pixels(
		GtBoxerArrayU8 aGtBoxerArrayU8,
		int32 aWidth,
		int32 aHeight,
		size_t anAmountOfBytesPerRow,
		SkiaColorType aColorType))
]

{ #category : #'private - ffi' }
SkiaImage class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_image_drop(void* aHandle))
]

{ #category : #converting }
SkiaImage >> asForm [
	<return: #Form>
	
	^ Form extent: self extent depth: 32 bits: self data asBitmap
]

{ #category : #accessing }
SkiaImage >> data [
	<return: #GtBoxerArrayU8>
	| anImageInfo anArray |
	
	anImageInfo := self imageInfo.
	anArray := GtBoxerArrayU8 new: anImageInfo byteSize withAll: 0.
	self primReadAllPixels: anArray.
	^ anArray
]

{ #category : #accessing }
SkiaImage >> extent [
	^ self width @ self height
]

{ #category : #'gt-extension' }
SkiaImage >> gtInforFor: aView [
	<gtView>

	^ (self imageInfo gtInforFor: aView)
		title: 'Info';
		priority: 2
]

{ #category : #'gt-extension' }
SkiaImage >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [ self asForm asElement ]
]

{ #category : #accessing }
SkiaImage >> height [
	^ self primGetHeight
]

{ #category : #accessing }
SkiaImage >> imageInfo [
	<return: #SkiaImageInfo>

	^ SkiaImageInfo fromNativeHandle: self primGetImageInfo
]

{ #category : #'private - ffi' }
SkiaImage >> primGetHeight [
	^ self ffiCall: #(int32 skia_image_get_height(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primGetImageInfo [
	^ self ffiCall: #(void* skia_image_get_image_info(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primGetUniqueId [
	^ self ffiCall: #(uint32 skia_image_get_unique_id(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primGetWidth [
	^ self ffiCall: #(int32 skia_image_get_width(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primReadAllPixels: aBoxerArrayU8 [
	^ self ffiCall: #(bool skia_image_read_all_pixels(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #accessing }
SkiaImage >> uniqueId [
	<return: #Number>
	
	^ self primGetUniqueId
]

{ #category : #accessing }
SkiaImage >> width [
	^ self primGetWidth
]
