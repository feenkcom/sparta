Class {
	#name : #SkiaImage,
	#superclass : #SkiaExternalObject,
	#traits : 'TSpartaSurface',
	#classTraits : 'TSpartaSurface classTrait',
	#instVars : [
		'gpuContext'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaImage class >> fromBGR: aData extent: anExtent stride: aStride [
	"aData is a pointer an array of bytes [u8] in BGR format"

	^ self ffiLibrary
		unsafeNewArrayU8FromData: aData
		length: anExtent y * aStride
		during: [ :anArrayU8 |
			self fromNativeHandle: (self
				primFromPixels: anArrayU8
				width: anExtent x height: anExtent y
				rowBytes: aStride
				colorType: SkiaColorType RGB888x) ]
]

{ #category : #'instance creation' }
SkiaImage class >> fromBGRA: aData extent: anExtent stride: aStride [
	"aData is a pointer an array of bytes [u8] in BGRA format"

	^ self ffiLibrary
		unsafeNewArrayU8FromData: aData
		length: anExtent y * aStride
		during: [ :anArrayU8 |
			self fromNativeHandle: (self
				primFromPixels: anArrayU8
				width: anExtent x height: anExtent y
				rowBytes: aStride
				colorType: SkiaColorType BGRA8888) ]
]

{ #category : #'instance creation' }
SkiaImage class >> fromBuffer: aByteArray start: startInteger end: endInteger [
	"Create a SkiaImage from the supplied buffer (encoded JPG, PNG, BMP, etc.)"
	| aHandle |

	aHandle := self ffiLibrary
		newArrayU8FromByteArray: aByteArray
		during: [ :anArrayU8 | self
			primFromBuffer: anArrayU8
			start: startInteger
			end: endInteger ].

	aHandle isNull ifTrue: [ self error: 'Unable to decode the supplied buffer' ].
	^ self fromNativeHandle: aHandle
]

{ #category : #'instance creation' }
SkiaImage class >> fromFile: aFileReference [
	"Create a SkiaImage from the supplied file (JPG, PNG, BMP, etc.)"
	| fileReference handle |

	fileReference := aFileReference asFileReference asAbsolute.

	handle := self ffiLibrary
		newString: fileReference pathString
		during: [ :aStringBox | self primFromFile: aStringBox ].

	handle isNull ifTrue: [ self error: 'Unable to open: ', fileReference pathString ].

	^ self fromNativeHandle: handle
]

{ #category : #'instance creation' }
SkiaImage class >> fromForm: aForm [
	| aForm32 theBits aRowBytes |

	aForm32 := aForm unhibernate; asFormOfDepth: 32.
	theBits := aForm32 bits.
	aRowBytes := theBits
		ifEmpty: [ 0 ]
		ifNotEmpty: [ theBits size // aForm32 height * 4 ].

	^ self ffiLibrary
		newArrayU8FromBitmap: theBits
		during: [ :anArrayU8 |
			self fromNativeHandle: (self
				primFromPixels: anArrayU8
				width: aForm32 width
				height: aForm32 height
				rowBytes: aRowBytes
				colorType: SkiaColorType BGRA8888) ]
]

{ #category : #'instance creation' }
SkiaImage class >> fromForm: aForm during: aBlock [
	| aForm32 theBits aRowBytes |
	
	aForm32 := aForm unhibernate; asFormOfDepth: 32.
	theBits := aForm32 bits.
	aRowBytes := theBits
		ifEmpty: [ 0 ]
		ifNotEmpty: [ theBits size // aForm32 height * 4 ].
			
	^ self ffiLibrary
		newArrayU8FromBitmap: theBits
		during: [ :anArrayU8 |
			self fromNativeHandle: (self
				primFromPixels: anArrayU8
				width: aForm32 width
				height: aForm32 height
				rowBytes: aRowBytes
				colorType: SkiaColorType BGRA8888)
			during: aBlock ]
]

{ #category : #'instance creation' }
SkiaImage class >> fromGray: aData extent: anExtent stride: aStride [
	^ self ffiLibrary
		unsafeNewArrayU8FromData: aData
		length: anExtent y * aStride
		during: [ :anArrayU8 |
			self fromNativeHandle: (self
				primFromPixels: anArrayU8
				width: anExtent x height: anExtent y
				rowBytes: aStride
				colorType: SkiaColorType Gray8) ]
]

{ #category : #'instance creation' }
SkiaImage class >> fromRGBA: aData extent: anExtent stride: aStride [
	^ self ffiLibrary
		unsafeNewArrayU8FromData: aData
		length: anExtent y * aStride
		during: [ :anArrayU8 |
			self fromNativeHandle: (self
				primFromPixels: anArrayU8
				width: anExtent x height: anExtent y
				rowBytes: aStride
				colorType: SkiaColorType RGBA8888) ]
]

{ #category : #'private - ffi' }
SkiaImage class >> primFromBuffer: aGtBoxerArrayU8 start: startInteger end: endInteger [

	^ self ffiCall: #(void* skia_image_from_buffer(GtBoxerArrayU8 aGtBoxerArrayU8, size_t startInteger, size_t endInteger))
]

{ #category : #'private - ffi' }
SkiaImage class >> primFromFile: aGtBoxerString [
	^ self ffiCall: #(void* skia_image_from_file(GtBoxerString aGtBoxerString))
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
SkiaImage >> asElement [

	^ BlSkiaImageElement new image: self
]

{ #category : #converting }
SkiaImage >> asForm [
	<return: #Form>
	| theData aColorType |
	
	theData := self data.
	
	aColorType := self imageInfo colorType.
	aColorType = SkiaColorType RGBA8888
		ifTrue: [ theData rgbaToArgb ].
	aColorType = SkiaColorType BGRA8888
		ifTrue: [ theData bgraToArgb ].
	
	^ Form extent: self extent depth: 32 bits: theData asBitmap
]

{ #category : #accessing }
SkiaImage >> backendTexture [
	^ SkiaBackendTexture fromNativeHandle: self primGetBackendTexture
]

{ #category : #accessing }
SkiaImage >> backendTextureOrigin [
	^ self primGetBackendTextureOrigin
]

{ #category : #accessing }
SkiaImage >> data [
	<return: #GtBoxerArrayU8>
	| anImageInfo anArray |
	
	anImageInfo := self imageInfo.
	anArray := self ffiLibrary newArrayU8: anImageInfo byteSize withAll: 0.
	self primReadAllPixels: anArray.
	^ anArray
]

{ #category : #accessing }
SkiaImage >> extent [
	^ self width @ self height
]

{ #category : #accessing }
SkiaImage >> gpuContext [
	^ gpuContext
]

{ #category : #accessing }
SkiaImage >> gpuContext: anObject [
	gpuContext := anObject
]

{ #category : #'gt-extension' }
SkiaImage >> gtBackendTextureFor: aView [
	<gtView>

	^ (self backendTexture gtInfoFor: aView)
		title: 'Backend texture';
		priority: 4
]

{ #category : #'gt-extension' }
SkiaImage >> gtBackendTextureInfoFor: aView [
	<gtView>

	^ (self backendTexture gtTextureInfoFor: aView)
		title: 'Backend texture info';
		priority: 5
]

{ #category : #'gt-extension' }
SkiaImage >> gtImageInfoFor: aView [
	<gtView>

	^ (self imageInfo gtInfoFor: aView)
		title: 'Image info';
		priority: 3
]

{ #category : #'gt-extension' }
SkiaImage >> gtInfoFor: aView [
	<gtView>

	^ ({
		#extent -> self extent.
		#uniqueId -> self uniqueId.
		#isAlphaOnly -> self isAlphaOnly.
		#isOpaque -> self isOpaque.
		#isTextureBackend -> self isTextureBackend
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'gt-extension' }
SkiaImage >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: 
			[ self asElement
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ] ].
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

{ #category : #testing }
SkiaImage >> isAlphaOnly [
	<return: #Boolean>
	
	^ self primIsAlphaOnly
]

{ #category : #testing }
SkiaImage >> isOpaque [
	<return: #Boolean>
	
	^ self primIsOpaque
]

{ #category : #testing }
SkiaImage >> isTextureBackend [
	<return: #Boolean>
	
	^ self primIsTextureBackend
]

{ #category : #'private - ffi' }
SkiaImage >> primGetBackendTexture [
	^ self ffiCall: #(void* skia_image_get_backend_texture(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primGetBackendTextureOrigin [
	^ self ffiCall: #(int32 skia_image_get_backend_texture_origin(self))
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
SkiaImage >> primIsAlphaOnly [
	^ self ffiCall: #(bool skia_image_is_alpha_only(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primIsOpaque [
	^ self ffiCall: #(bool skia_image_is_opaque(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primIsTextureBackend [
	^ self ffiCall: #(bool skia_image_is_texture_backend(self))
]

{ #category : #'private - ffi' }
SkiaImage >> primReadAllPixels: aBoxerArrayU8 [
	^ self ffiCall: #(bool skia_image_read_all_pixels(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #'private - ffi' }
SkiaImage >> primSaveFile: fileName format: format quality: aNumber [

	^ self ffiCall: #(int32 skia_image_to_file(self, GtBoxerString fileName,
				SkiaEncodedImageFormat format, int32 aNumber))
]

{ #category : #'private - ffi' }
SkiaImage >> primScalex: xInt y: yInt keepAspectRatio: aBoolean quality: quality [

	^ self ffiCall: #(void* skia_scale_image(self, int32 xInt, int32 yInt, bool aBoolean, SkiaFilterQuality quality))
]

{ #category : #actions }
SkiaImage >> saveFile: fileNameString format: format quality: aNumber [ 
	"Save the receiver as an image file with format JPEG, BMP or PNG.
	Quality is between 1 (lowest quality) and 100 (highest quality)"
	| status |

	self assert: fileNameString isString.
	self assert: (aNumber between: 1 and: 100).

	status := self ffiLibrary
		newString: fileNameString
		during: [ :aFileNameStringBox | self primSaveFile: aFileNameStringBox format: format quality: aNumber ].

	self assert: status = 0.
]

{ #category : #actions }
SkiaImage >> savePng: fileNameString [
	"Save the receiver as a PNG image file with the highest quality"
	| status |

	self assert: fileNameString isString.

	status := self ffiLibrary
		newString: fileNameString
		during: [ :aFileNameStringBox |
			self
				primSaveFile: aFileNameStringBox
				format: SkiaEncodedImageFormat PNG
				quality: 100 ].

	self assert: status = 0.
]

{ #category : #actions }
SkiaImage >> scalex: xInt y: yInt keepAspectRatio: aBoolean quality: quality [

	^ self class fromHandle: (self 
		primScalex: xInt 
		y: yInt 
		keepAspectRatio: aBoolean
		quality: quality)
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
