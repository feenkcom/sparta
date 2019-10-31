"
I am hardware accelerated Skia canvas.

I use OpenGL or Vulkan as my rendering backend
"
Class {
	#name : #MozSkiaCanvas,
	#superclass : #MozCanvas,
	#instVars : [
		'context'
	],
	#category : #'Sparta-Moz2D-Skia'
}

{ #category : #'instance creation' }
MozSkiaCanvas class >> createContext: aGrContext extent: anExtent [

	^ self
		createContext: aGrContext
		extent: anExtent
		renderExtent: anExtent
]

{ #category : #'instance creation' }
MozSkiaCanvas class >> createContext: aGrContext extent: anExtent renderExtent: aRenderExtent [

	^ self
		createContext: aGrContext
		extent: anExtent
		renderExtent: aRenderExtent
		format: MozSurfaceFormat B8G8R8A8
]

{ #category : #'instance creation' }
MozSkiaCanvas class >> createContext: aGrContext extent: anExtent renderExtent: aRenderExtent format: aSurfaceFormat [

	^ (self
		primCreateContext: aGrContext
		width: anExtent x
		height: anExtent y
		renderWidth: aRenderExtent x
		renderHeight: aRenderExtent y
		format: aSurfaceFormat)
			autoRelease;
			initialize;
			context: aGrContext;
			yourself
]

{ #category : #'instance creation' }
MozSkiaCanvas class >> extent: aPoint [
	^ self
		extent: aPoint
		renderExtent: aPoint
]

{ #category : #'instance creation' }
MozSkiaCanvas class >> extent: anExtent renderExtent: aRenderExtent [
	| aGrContext |

	"try Vulkan first"
	aGrContext := MozSkiaGrContext create: MozSkiaBackend kVulkan_GrBackend.
	
	"if not try OpenGL"
	aGrContext isNull
		ifTrue: [ aGrContext := MozSkiaGrContext create: MozSkiaBackend kOpenGL_GrBackend ].
	
	"still no luck... acceleration disabled?
	fallback to software"
	aGrContext isNull
		ifTrue: [ ^ super extent: anExtent ].
	
	^ self
		createContext: aGrContext
		extent: anExtent
		renderExtent: aRenderExtent
]

{ #category : #testing }
MozSkiaCanvas class >> isSupported [
	"Return true if Skia GPU canvas is available and supported, false otherwise"
	<return: #Boolean>

	^ MozLibrary uniqueInstance hasModule and: [
		self primAllowsSkiaGPU and: [
			self primAllowsAcceleratedCanvas and: [
				self primAllowsOpenGLCanvas ] ] ]
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primAllowsAcceleratedCanvas [
	^ self ffiCall: #(bool moz2d_gl_allow_accelerated_canvas())
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primAllowsOpenGLCanvas [
	^ self ffiCall: #(bool moz2d_gl_allow_opengl_canvas())
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primAllowsSkiaGPU [
	^ self ffiCall: #(bool moz2d_gl_use_skia_gpu())
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primCreate: aBackendType width: width height: height format: aSurfaceFormat [

	^ self ffiCall: #( #MozSkiaCanvas moz2d_draw_target_create_type (
		MozBackendType aBackendType,
		int32 width,
		int32 height,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primCreateContext: aGrContext width: aWidth height: aHeight renderWidth: aRenderWidth renderHeight: aRenderHeight format: aSurfaceFormat [

	^ self ffiCall: #(#MozSkiaCanvas moz2d_gl_skia_draw_target_create_from_native_context (
		#MozSkiaGrContext aGrContext,
		int32 aWidth, 
		int32 aHeight,
		int32 aRenderWidth,
		int32 aRenderHeight,
		MozSurfaceFormat aSurfaceFormat))
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primCreateForData: aBackendType data: aData width: width height: height stride: stride format: aSurfaceFormat uninitialized: Uninitialized [

	^ self ffiCall: #( #MozSkiaCanvas moz2d_draw_target_create_for_data_type (
		MozBackendType aBackendType,
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat,
		bool Uninitialized) )
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primCreateForData: aData width: width height: height stride: stride format: aSurfaceFormat [

	^ self
		primCreateForData: MozBackendType SKIA
		data: aData
		width: width
		height: height
		stride: stride
		format: aSurfaceFormat
		uninitialized: true
]

{ #category : #'private - ffi' }
MozSkiaCanvas class >> primCreateWidth: width height: height format: aSurfaceFormat [

	^ self
		primCreate: MozBackendType SKIA
		width: width
		height: height
		format: aSurfaceFormat
]

{ #category : #accessing }
MozSkiaCanvas >> context [
	^ context
]

{ #category : #accessing }
MozSkiaCanvas >> context: anObject [
	context := anObject
]

{ #category : #'private - ffi - accessing' }
MozSkiaCanvas >> primGetStride [
	^ 0
]
