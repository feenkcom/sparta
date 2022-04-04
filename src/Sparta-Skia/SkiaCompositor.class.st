Class {
	#name : #SkiaCompositor,
	#superclass : #Object,
	#instVars : [
		'session',
		'cache'
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
	uniqueInstance ifNil: [ uniqueInstance := self new cache: SkiaCompositorCache new ].
	uniqueInstance session == Smalltalk session
		ifFalse: [ uniqueInstance := self new cache: SkiaCompositorCache new ].
	^ uniqueInstance
]

{ #category : #accessing }
SkiaCompositor >> cache: anObject [

	cache := anObject
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
	
	session := Smalltalk session
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
		SkiaCompositorCache cache))
]

{ #category : #accessing }
SkiaCompositor >> session [
	^ session
]
