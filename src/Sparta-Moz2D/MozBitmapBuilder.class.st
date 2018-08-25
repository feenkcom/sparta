Class {
	#name : #MozBitmapBuilder,
	#superclass : #SpartaBitmapBuilder,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #'instance creation' }
MozBitmapBuilder >> fromForm: aForm [
	| form |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	^ (self
		primCreateSurfaceForData: form bits
		width: form width
		height: form height
		stride: form stride
		format: canvas pixelFormat) autoRelease
]

{ #category : #'instance creation' }
MozBitmapBuilder >> fromOpenGLTexture: aSpartaOpenGLTexture [
	| format aGLuid surface |
	
	format := aSpartaOpenGLTexture format
		ifNil: [ MozSurfaceFormat B8G8R8A8 ].
	
	aGLuid := FFIExternalArray newType: 'int' size: 1.
	aGLuid at: 1 put: aSpartaOpenGLTexture id.
	
	surface := (self
		primCreateSurfaceFromNative: aSpartaOpenGLTexture id
		width: aSpartaOpenGLTexture extent x
		height: aSpartaOpenGLTexture extent y
		type: MozNativeSurfaceType OPENGL_TEXTURE
		format: format) autoRelease.
	
	aGLuid free.
	
	^ surface
]

{ #category : #'private - ffi' }
MozBitmapBuilder >> primCreateSurfaceForData: aData width: width height: height stride: stride format: aSurfaceFormat [

	^ self ffiCall: #( MozSurface moz2d_draw_target_create_surface_for_data_form (
		MozCanvas canvas,
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #'private - ffi' }
MozBitmapBuilder >> primCreateSurfaceFromNative: aNativeSurface width: aWidth height: aHeight type: aSurfaceType format: aSurfaceFormat [

	^ self ffiCall: #( MozSurface moz2d_draw_target_create_surface_from_native (
		MozCanvas canvas,
		MozNativeSurfaceType aSurfaceType,
		MozSurfaceFormat aSurfaceFormat,
		int32 aWidth,
		int32 aHeight,
		int aNativeSurface) )
]
