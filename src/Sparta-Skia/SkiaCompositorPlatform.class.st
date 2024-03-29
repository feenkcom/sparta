Class {
	#name : #SkiaCompositorPlatform,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorPlatform class >> forAndroid: aNativeWindow extent: anExtent [
	^ self fromNativeHandle: (self primCreateAndroid: aNativeWindow width: anExtent x height: anExtent y)
]

{ #category : #'instance creation' }
SkiaCompositorPlatform class >> forAngle: aWindowHWND extent: anExtent [
	^ self fromNativeHandle: (self primCreateAngle: aWindowHWND width: anExtent x height: anExtent y)
]

{ #category : #'instance creation' }
SkiaCompositorPlatform class >> forD3D: aWindowHWND extent: anExtent [
	^ self fromNativeHandle: (self primCreateD3D: aWindowHWND width: anExtent x height: anExtent y)
]

{ #category : #'instance creation' }
SkiaCompositorPlatform class >> forMetal: nsView extent: anExtent [
	^ self fromNativeHandle: (self primCreateMetal: nsView width: anExtent x height: anExtent y)
]

{ #category : #'instance creation' }
SkiaCompositorPlatform class >> forWaylandDisplay: aWaylandDisplay surface: aWaylandSurface extent: anExtent [
	^ self fromNativeHandle: (self primCreateWaylandDisplay: aWaylandDisplay surface: aWaylandSurface width: anExtent x height: anExtent y)
]

{ #category : #'instance creation' }
SkiaCompositorPlatform class >> forXlibDisplay: anXlibDisplay window: anXlibWindow extent: anExtent [
	^ self fromNativeHandle: (self primCreateXlibDisplay: anXlibDisplay window: anXlibWindow width: anExtent x height: anExtent y)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primCreateAndroid: aNativeWindow width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_android_egl_compositor_new_size(void* aNativeWindow, int32 aWidth, int32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primCreateAngle: aWindowHWND width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_angle_compositor_new_size(void* aWindowHWND, uint32 aWidth, uint32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primCreateD3D: aWindowHWND width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_d3d_compositor_new_size(void* aWindowHWND, uint32 aWidth, uint32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primCreateMetal: nsView width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_metal_compositor_new_size(void* nsView, uint32 aWidth, uint32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primCreateWaylandDisplay: aWaylandDisplay surface: aWaylandSurface width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_wayland_egl_compositor_new_size(void* aWaylandDisplay, void* aWaylandSurface, uint32 aWidth, uint32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primCreateXlibDisplay: anXlibDisplay window: anXlibWindow width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_xlib_gl_compositor_new_size(void* anXlibDisplay, ulong anXlibWindow, uint32 aWidth, uint32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self
		ffiCall: #(void skia_platform_compositor_drop(void* aHandle))
		options: #(optEventLoop)
]

{ #category : #'api - drawing' }
SkiaCompositorPlatform >> disableFPS [
	self primDisableFPS
]

{ #category : #'api - drawing' }
SkiaCompositorPlatform >> draw [
	self primDraw
]

{ #category : #'api - drawing' }
SkiaCompositorPlatform >> enableFPS [
	self primEnableFPS
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform >> primDisableFPS [
	self
		ffiCall: #(void skia_platform_compositor_disable_fps(self))
		options: #(optEventLoop optNonBlocking)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform >> primDraw [
	self
		ffiCall: #(void skia_platform_compositor_draw(self))
		options: #(optEventLoop optNonBlocking)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform >> primEnableFPS [
	self
		ffiCall: #(void skia_platform_compositor_enable_fps(self))
		options: #(optEventLoop optNonBlocking)
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform >> primResizeWidth: aWidth height: aHeight [
	self ffiCall: #(void skia_platform_compositor_resize(
		self,
		uint32 aWidth,
		uint32 aHeight))
]

{ #category : #'private - ffi' }
SkiaCompositorPlatform >> primSubmitLayer: aSkiaCompositionLayer [
	self ffiCall: #(void skia_platform_compositor_submit_layer(
		self,
		SkiaCompositionLayer aSkiaCompositionLayer))
]

{ #category : #'api - drawing' }
SkiaCompositorPlatform >> resize: anExtent [
	self
		primResizeWidth: anExtent x
		height: anExtent y
]

{ #category : #'api - drawing' }
SkiaCompositorPlatform >> submitLayer: aSkiaCompositionLayer [
	self primSubmitLayer: aSkiaCompositionLayer
]
