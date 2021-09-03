Class {
	#name : 'SkiaCompositionPictureLayer',
	#superclass : 'SkiaCompositionLayer',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaCompositionPictureLayer class >> picture: aSkiaPicture [
	^ self fromNativeHandle: (self primFromPicture: aSkiaPicture)
]

{ #category : 'private - ffi' }
SkiaCompositionPictureLayer class >> primCreate [
	^ self ffiCall: #(void* skia_picture_layer_new_picture(0))
]

{ #category : 'private - ffi' }
SkiaCompositionPictureLayer class >> primFromPicture: aSkiaPicture [
	^ self ffiCall: #(void* skia_picture_layer_new_picture(SkiaPicture aSkiaPicture))
]

{ #category : 'accessing' }
SkiaCompositionPictureLayer >> needsCache [
	^ self primGetNeedsCache
]

{ #category : 'accessing' }
SkiaCompositionPictureLayer >> needsCache: aBoolean [
	self primSetNeedsCache: aBoolean
]

{ #category : 'private - ffi' }
SkiaCompositionPictureLayer >> primGetNeedsCache [
	^ self ffiCall: #(bool skia_picture_layer_get_needs_cache(self))
]

{ #category : 'private - ffi' }
SkiaCompositionPictureLayer >> primSetNeedsCache: aBoolean [
	^ self ffiCall: #(void skia_picture_layer_set_needs_cache(self, bool aBoolean))
]
