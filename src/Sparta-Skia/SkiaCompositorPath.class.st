Class {
	#name : #SkiaCompositorPath,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorPath class >> fromSkiaPath: aSkiaPath [
	^ self fromNativeHandle: (self primCreate: aSkiaPath)
]

{ #category : #'instance creation' }
SkiaCompositorPath class >> fromSkiaPath: aSkiaPath during: aBlock [
	^ self fromNativeHandle: (self primCreate: aSkiaPath) during: aBlock
]

{ #category : #'private - ffi' }
SkiaCompositorPath class >> primCreate: aSkiaPath [
	self ffiCall: #(void* skia_compositor_path_new(SkiaPath aSkiaPath))
]

{ #category : #'private - ffi' }
SkiaCompositorPath class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_path_drop(void** aHandle))
]
