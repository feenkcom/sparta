Class {
	#name : #SkiaCompositionPictureLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionPictureLayer class >> picture: aSkiaPicture needsCache: needsCache [
	^ SkiaCompositorPicture
		fromSkiaPicture: aSkiaPicture
		during: [ :aCompositorPicture | self fromNativeHandle: (self primFromPicture: aCompositorPicture needsCache: needsCache) ]
]

{ #category : #'private - ffi' }
SkiaCompositionPictureLayer class >> primFromPicture: aSkiaCompositorPicture needsCache: needsCache [
	^ self ffiCall: #(void* compositor_picture_layer_new(SkiaCompositorPicture aSkiaCompositorPicture, bool needsCache))
]

{ #category : #accessing }
SkiaCompositionPictureLayer >> needsCache [
	^ self primGetNeedsCache
]

{ #category : #'private - ffi' }
SkiaCompositionPictureLayer >> primGetNeedsCache [
	^ self ffiCall: #(bool compositor_picture_layer_needs_cache(self))
]
