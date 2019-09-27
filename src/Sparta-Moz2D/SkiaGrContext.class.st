"
I represent a GrContext object which manages the GPU context, and related caches for textures and fonts.
GrContexts are matched one to one with OpenGL contexts or Vulkan devices.
"
Class {
	#name : #SkiaGrContext,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'isHeadless'
	],
	#category : 'Sparta-Moz2D-Skia'
}

{ #category : #'instance creation' }
SkiaGrContext class >> create: aBackend [
	"Try to create a native GrContext with the given backend.
	Note, that this will succeed only if there is a window with initiazed context
	of the same type as a backend. If it is not the case I return a nullptr"
	<return: #SkiaGrContext>

	^ (self primCreateNative: aBackend)
		headless: false;
		yourself
]

{ #category : #'instance creation' }
SkiaGrContext class >> headless [
	"Try to create or return if already exists a unique instance of headless skia context.
	Headless context can be created without window. I may return nullptr if Skia GPU or
	accelerated canvases are not supported or disabled"
	<return: #SkiaGrContext>

	^ (self primGetHeadless)
		headless: true;
		yourself
]

{ #category : #'private - ffi' }
SkiaGrContext class >> primCreateNative: aBackend [

	^ self ffiCall: #(SkiaGrContext moz2d_gl_create_gr_context_native (SkiaBackend aBackend))
]

{ #category : #'private - ffi' }
SkiaGrContext class >> primGetHeadless [

	^ self ffiCall: #(SkiaGrContext moz2d_gl_get_gr_context ())
]

{ #category : #initialization }
SkiaGrContext >> headless: aBoolean [
	"Set if I was created for headless mode"

	self
		assert: [ isHeadless isNil ]
		description: [ 'Mode can not be changed on fly' ].

	isHeadless := aBoolean
]

{ #category : #testing }
SkiaGrContext >> isHeadless [
	"Return true if I was created for headless mode, false otherwise"
	<return: #Boolean>

	^ isHeadless
]
