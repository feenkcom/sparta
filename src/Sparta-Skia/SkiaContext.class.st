Class {
	#name : #SkiaContext,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaContext class >> fromInterface: aSkiaInterface [
	^ self fromNativeHandle: (self primCreate: aSkiaInterface)
]

{ #category : #'instance creation' }
SkiaContext class >> new [
	^ self fromInterface: (SkiaInterface new)
]

{ #category : #'private - ffi' }
SkiaContext class >> primCreate: aSkiaInterface [
	^ self ffiCall: #(void* skia_context_new_gl(SkiaInterface aSkiaInterface))
]

{ #category : #'private - ffi' }
SkiaContext class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_context_drop(void** aHandle))
]

{ #category : #accessing }
SkiaContext >> flush [
	self primFlush
]

{ #category : #testing }
SkiaContext >> isColorTypeSupportedAsImage: aSkiaColorType [
	<return: #Boolean>

	^ self primIsColorTypeSupportedAsImage: aSkiaColorType
]

{ #category : #testing }
SkiaContext >> isColorTypeSupportedAsSurface: aSkiaColorType [
	<return: #Boolean>

	^ self primIsColorTypeSupportedAsSurface: aSkiaColorType
]

{ #category : #accessing }
SkiaContext >> maxRenderTargetSize [
	<return: #Number>

	^ self primGetMaxRenderTargetSize
]

{ #category : #accessing }
SkiaContext >> maxSurfaceSampleCountForColorType: aSkiaColorType [
	<return: #Number>

	^ self primGetMaxSurfaceSampleCountForColorType: aSkiaColorType
]

{ #category : #accessing }
SkiaContext >> maxTextureSize [
	<return: #Number>

	^ self primGetMaxTextureSize
]

{ #category : #'private - ffi' }
SkiaContext >> primFlush [
	^ self ffiCall: #(bool skia_context_flush(self))
]

{ #category : #'private - ffi' }
SkiaContext >> primGetMaxRenderTargetSize [
	^ self ffiCall: #(int32 skia_context_get_max_render_target_size(self))
]

{ #category : #'private - ffi' }
SkiaContext >> primGetMaxSurfaceSampleCountForColorType: aSkiaColorType [
	^ self ffiCall: #(size_t skia_context_get_max_surface_sample_count_for_color_type(self, SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaContext >> primGetMaxTextureSize [
	^ self ffiCall: #(int32 skia_context_get_max_texture_size(self))
]

{ #category : #'private - ffi' }
SkiaContext >> primIsColorTypeSupportedAsImage: aSkiaColorType [
	^ self ffiCall: #(bool skia_context_is_color_type_supported_as_image(self, SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaContext >> primIsColorTypeSupportedAsSurface: aSkiaColorType [
	^ self ffiCall: #(bool skia_context_is_color_type_supported_as_surface(self, SkiaColorType aSkiaColorType))
]
