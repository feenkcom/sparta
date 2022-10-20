Class {
	#name : #SkiaDirectContext,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaDirectContext class >> fromInterface: aSkiaInterface [
	^ self fromNativeHandle: (self primCreateGl: aSkiaInterface)
]

{ #category : #'instance creation' }
SkiaDirectContext class >> new [
	^ self fromInterface: SkiaInterface new
]

{ #category : #'private - ffi' }
SkiaDirectContext class >> primCreate: aSkiaInterface [
	^ self ffiCall: #(void* skia_context_new_gl(SkiaInterface aSkiaInterface))
]

{ #category : #'private - ffi' }
SkiaDirectContext class >> primCreateGl: aSkiaInterface [
	^ self ffiCall: #(void* skia_context_new_gl(SkiaInterface aSkiaInterface))
]

{ #category : #'private - ffi' }
SkiaDirectContext class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_context_drop(void* aHandle))
]

{ #category : #accessing }
SkiaDirectContext >> flush [
	self primFlush
]

{ #category : #testing }
SkiaDirectContext >> isColorTypeSupportedAsImage: aSkiaColorType [
	<return: #Boolean>

	^ self primIsColorTypeSupportedAsImage: aSkiaColorType
]

{ #category : #testing }
SkiaDirectContext >> isColorTypeSupportedAsSurface: aSkiaColorType [
	<return: #Boolean>

	^ self primIsColorTypeSupportedAsSurface: aSkiaColorType
]

{ #category : #accessing }
SkiaDirectContext >> maxRenderTargetSize [
	<return: #Number>

	^ self primGetMaxRenderTargetSize
]

{ #category : #accessing }
SkiaDirectContext >> maxSurfaceSampleCountForColorType: aSkiaColorType [
	<return: #Number>

	^ self primGetMaxSurfaceSampleCountForColorType: aSkiaColorType
]

{ #category : #accessing }
SkiaDirectContext >> maxTextureSize [
	<return: #Number>

	^ self primGetMaxTextureSize
]

{ #category : #'private - ffi' }
SkiaDirectContext >> primFlush [
	^ self ffiCall: #(bool skia_context_flush(self))
]

{ #category : #'private - ffi' }
SkiaDirectContext >> primGetMaxRenderTargetSize [
	^ self ffiCall: #(int32 skia_context_get_max_render_target_size(self))
]

{ #category : #'private - ffi' }
SkiaDirectContext >> primGetMaxSurfaceSampleCountForColorType: aSkiaColorType [
	^ self ffiCall: #(size_t skia_context_get_max_surface_sample_count_for_color_type(self, SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaDirectContext >> primGetMaxTextureSize [
	^ self ffiCall: #(int32 skia_context_get_max_texture_size(self))
]

{ #category : #'private - ffi' }
SkiaDirectContext >> primIsColorTypeSupportedAsImage: aSkiaColorType [
	^ self ffiCall: #(bool skia_context_is_color_type_supported_as_image(self, SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaDirectContext >> primIsColorTypeSupportedAsSurface: aSkiaColorType [
	^ self ffiCall: #(bool skia_context_is_color_type_supported_as_surface(self, SkiaColorType aSkiaColorType))
]
