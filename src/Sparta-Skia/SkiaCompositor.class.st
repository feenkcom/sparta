Class {
	#name : #SkiaCompositor,
	#superclass : #Object,
	#instVars : [
		'session',
		'imageCache',
		'shadowCache'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #accessing }
SkiaCompositor class >> ffiLibrary [
	^ SkiaLibrary
]

{ #category : #accessing }
SkiaCompositor class >> uniqueInstance [
	uniqueInstance ifNil: [ uniqueInstance := self new ].
	uniqueInstance session == Smalltalk session
		ifFalse: [ uniqueInstance := self new ].
	^ uniqueInstance
]

{ #category : #accessing }
SkiaCompositor >> cachedImagesCount [
	"Return the amount of cached images"
	<return: #Number>

	^ self primCountCachedImages
]

{ #category : #accessing }
SkiaCompositor >> cachedShadowsCount [
	"Return the amount of cached shadows"
	<return: #Number>

	^ self primCountCachedShadows
]

{ #category : #drawing }
SkiaCompositor >> draw: aSkiaCompositionLayer on: aSkiaCanvas [
	self primDraw: aSkiaCompositionLayer on: aSkiaCanvas surfaceCanvas
]

{ #category : #accessing }
SkiaCompositor >> ffiLibrary [
	^ self class ffiLibrary
]

{ #category : #'gt-extension' }
SkiaCompositor >> gtInfoFor: aView [
	<gtView>

	^ ({
		#'cached images' -> self cachedImagesCount.
		#'cached shadows' -> self cachedShadowsCount
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 3
]

{ #category : #initialization }
SkiaCompositor >> initialize [
	super initialize.
	
	session := Smalltalk session.
	imageCache := SkiaCompositorImageCache new.
	shadowCache := SkiaCompositorShadowCache new.
]

{ #category : #drawing }
SkiaCompositor >> metalDraw: aSkiaCompositionLayer on: aSkiaMetalContext [
	self
		primMetalDraw: aSkiaCompositionLayer
		on: aSkiaMetalContext
]

{ #category : #'private - ffi' }
SkiaCompositor >> primCountCachedImages [
	^ self ffiCall: #(size_t skia_compositor_count_cached_images(self))
]

{ #category : #'private - ffi' }
SkiaCompositor >> primCountCachedShadows [
	^ self ffiCall: #(size_t skia_compositor_count_cached_shadows(self))
]

{ #category : #'private - ffi' }
SkiaCompositor >> primDraw: aSkiaCompositionLayer on: aSkiaSurfaceCanvas [
	self ffiCall: #(void skia_compositor_compose(
		SkiaCompositionLayer aSkiaCompositionLayer,
		SkiaSurfaceCanvas aSkiaSurfaceCanvas,
		SkiaCompositorImageCache imageCache,
		SkiaCompositorShadowCache shadowCache))
]

{ #category : #'private - ffi' }
SkiaCompositor >> primMetalDraw: aSkiaCompositionLayer on: aSkiaMetalContext [
	self ffiCall: #(void skia_metal_context_draw_composition_layer(
		SkiaMetalContext aSkiaMetalContext,
		SkiaCompositionLayer aSkiaCompositionLayer,
		SkiaCompositorImageCache imageCache,
		SkiaCompositorShadowCache shadowCache))
	options: #(optEventLoop optNonBlocking)
]

{ #category : #accessing }
SkiaCompositor >> session [
	^ session
]
