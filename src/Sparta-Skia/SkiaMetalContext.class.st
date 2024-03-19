Class {
	#name : #SkiaMetalContext,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaMetalContext class >> forNSView: nsView [
	^ self fromNativeHandle: (self primCreate: nsView)
]

{ #category : #'instance creation' }
SkiaMetalContext class >> forNSView: nsView extent: anExtent [
	^ self fromNativeHandle: (self primCreate: nsView width: anExtent x height: anExtent y)
]

{ #category : #'private - ffi' }
SkiaMetalContext class >> primCreate: nsView [
	^ self ffiCall: #(void* skia_context_new_metal(void* nsView)) options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaMetalContext class >> primCreate: nsView width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_context_new_metal_size(void* nsView, float32 aWidth, float32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaMetalContext class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_metal_context_drop(void* aHandle)) options: #(optEventLoop)
]

{ #category : #accessing }
SkiaMetalContext >> directContext [
	^ SkiaDirectContext fromNativeHandle: self primDirectContext
]

{ #category : #accessing }
SkiaMetalContext >> drawableSize: aPoint [
	self
		primSetDrawableWidth: aPoint x
		height: aPoint y
]

{ #category : #accessing }
SkiaMetalContext >> flush [
]

{ #category : #'private - ffi' }
SkiaMetalContext >> primDirectContext [
	^ self ffiCall: #(void* skia_metal_context_get_direct_context(self))
]

{ #category : #'private - ffi' }
SkiaMetalContext >> primNewSurface [
	^ self ffiCall: #(void* skia_metal_context_new_surface(self))
]

{ #category : #'private - ffi' }
SkiaMetalContext >> primSetDrawableWidth: aWidth height: aHeight [
	^ self
		ffiCall: #(void skia_metal_context_set_drawable_size(self, float32 aWidth, float32 aHeight))
		options: #(optEventLoop optNonBlocking)
]

{ #category : #accessing }
SkiaMetalContext >> surface [
	^ SkiaPixelSurface fromNativeHandle: self primNewSurface
]

{ #category : #accessing }
SkiaMetalContext >> surfaceDuring: aBlock [
	^ SkiaPixelSurface fromNativeHandle: self primNewSurface during: aBlock
]
