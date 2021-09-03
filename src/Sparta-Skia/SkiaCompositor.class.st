Class {
	#name : 'SkiaCompositor',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaCompositor class >> primCreate [
	^ self ffiCall: #(void* skia_compositor_new())
]

{ #category : 'private - ffi' }
SkiaCompositor class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_compositor_drop(void** aHandle))
]

{ #category : 'accessing' }
SkiaCompositor >> cachedImagesCount [
	"Return the amount of cached images"
	<return: #Number>

	^ self primCountCachedImages
]

{ #category : 'accessing' }
SkiaCompositor >> cachedShadowsCount [
	"Return the amount of cached shadows"
	<return: #Number>

	^ self primCountCachedShadows
]

{ #category : 'drawing' }
SkiaCompositor >> draw: aSkiaCompositionLayer on: aSkiaCanvas [
	self primDraw: aSkiaCompositionLayer on: aSkiaCanvas surfaceCanvas
]

{ #category : 'gt-extension' }
SkiaCompositor >> gtInfoFor: aView [
	<gtView>

	^ ({
		#'cached images' -> self cachedImagesCount.
		#'cached shadows' -> self cachedShadowsCount
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 3
]

{ #category : 'private - ffi' }
SkiaCompositor >> primCountCachedImages [
	^ self ffiCall: #(size_t skia_compositor_count_cached_images(self))
]

{ #category : 'private - ffi' }
SkiaCompositor >> primCountCachedShadows [
	^ self ffiCall: #(size_t skia_compositor_count_cached_shadows(self))
]

{ #category : 'private - ffi' }
SkiaCompositor >> primDraw: aSkiaCompositionLayer on: aSkiaSurfaceCanvas [
	self ffiCall: #(void skia_compositor_draw(self, SkiaCompositionLayer aSkiaCompositionLayer, SkiaSurfaceCanvas aSkiaSurfaceCanvas))
]
