Class {
	#name : #SkiaImage,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

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
