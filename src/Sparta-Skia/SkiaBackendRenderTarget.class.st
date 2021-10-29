Class {
	#name : #SkiaBackendRenderTarget,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaBackendRenderTarget class >> newGlExtent: anExtent sampleCount: aSampleCount stencilBits: aStencilBits framebufferId: aFramebufferId framebufferFormat: aFramebufferFormat [
	^ self fromNativeHandle: (self
		primNewGlWidth: anExtent x
		height: anExtent y
		sampleCount: aSampleCount
		stencilBits: aStencilBits
		framebufferId: aFramebufferId
		framebufferFormat: aFramebufferFormat)
]

{ #category : #'private - ffi' }
SkiaBackendRenderTarget class >> primNewGlWidth: aWidth height: aHeight sampleCount: aSampleCount stencilBits: aStencilBits framebufferId: aFramebufferId framebufferFormat: aFramebufferFormat [
	^ self ffiCall: #(void* skia_backend_render_target_new_gl(
		int32 aWidth,
		int32 aHeight,
		size_t aSampleCount,
		size_t aStencilBits,
		uint aFramebufferId,
		uint aFramebufferFormat
	))
]

{ #category : #'private - ffi' }
SkiaBackendRenderTarget class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_backend_render_target_drop(void** aHandle))
]

{ #category : #testing }
SkiaBackendRenderTarget >> isProtected [
	<return: #Boolean>

	^ self primIsProtected
]

{ #category : #testing }
SkiaBackendRenderTarget >> isValid [
	<return: #Boolean>

	^ self primIsValid
]

{ #category : #'private - ffi - testing' }
SkiaBackendRenderTarget >> primIsProtected [
	^ self ffiCall: #(bool skia_backend_render_target_is_protected(self))
]

{ #category : #'private - ffi - testing' }
SkiaBackendRenderTarget >> primIsValid [
	^ self ffiCall: #(bool skia_backend_render_target_is_valid(self))
]
