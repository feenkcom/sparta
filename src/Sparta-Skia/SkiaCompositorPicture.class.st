Class {
	#name : #SkiaCompositorPicture,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorPicture class >> fromSkiaPicture: aSkiaPicture [
	^ self fromNativeHandle: (self primSkiaPicture: aSkiaPicture)
]

{ #category : #'instance creation' }
SkiaCompositorPicture class >> fromSkiaPicture: aSkiaPicture during: aBlock [
	^ self fromNativeHandle: (self primSkiaPicture: aSkiaPicture) during: aBlock
]

{ #category : #'private - ffi' }
SkiaCompositorPicture class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_picture_drop(void** aHandle))
]

{ #category : #'private - ffi' }
SkiaCompositorPicture class >> primSkiaPicture: aSkiaPicture [
	^ self ffiCall: #(void* skia_compositor_picture_new(SkiaPicture aSkiaPicture))
]
