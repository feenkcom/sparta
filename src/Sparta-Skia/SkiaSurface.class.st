Class {
	#name : #SkiaSurface,
	#superclass : #SkiaExternalObject,
	#traits : 'TSpartaSurface',
	#classTraits : 'TSpartaSurface classTrait',
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaSurface class >> newRasterPremultipled: anExtent [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling.
	^ self fromNativeHandle: (self primNewRaster32PremultipliedWidth: anIntegerExtent x height: anIntegerExtent y)
]

{ #category : #'private - ffi' }
SkiaSurface class >> primCreate [
	^ self ffiCall: #(void* skia_surface_new_default())
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRaster32PremultipliedWidth: aWidth height: aHeight [
	^ self ffiCall: #(void* skia_surface_new_raster_n32_premul(int32 aWidth, int32 aHeight))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_surface_drop(void* aHandle))
]

{ #category : #accessing }
SkiaSurface >> canvas [
	<return: #SkiaSurfaceCanvas>

	^ SkiaSurfaceCanvas fromNativeHandle: self primGetCanvas
]

{ #category : #accessing }
SkiaSurface >> data [
	<return: #GtBoxerArrayU8>
	| anImageInfo anArray |
	
	anImageInfo := self imageInfo.
	anArray := GtBoxerArrayU8 new: anImageInfo byteSize withAll: 0.
	self primReadAllPixels: anArray.
	^ anArray
]

{ #category : #accessing }
SkiaSurface >> extent [
	"Return my extent as point (width @ height).
	extent can not be nil"
	<return: #Point>
	| aWidth aHeight |
	
	aWidth := self primGetWidth.
	aHeight := self primGetHeight. 

	^ aWidth @ aHeight
]

{ #category : #'gt-extension' }
SkiaSurface >> gtInforFor: aView [
	<gtView>

	^ (self imageInfo gtInforFor: aView)
		title: 'Info';
		priority: 2
]

{ #category : #accessing }
SkiaSurface >> imageInfo [
	<return: #SkiaImageInfo>

	^ SkiaImageInfo fromNativeHandle: self primGetImageInfo
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetCanvas [
	^ self ffiCall: #(void* skia_surface_get_canvas(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetHeight [
	^ self ffiCall: #(int32 skia_surface_get_height(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetImageInfo [
	^ self ffiCall: #(void* skia_surface_get_image_info(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetWidth [
	^ self ffiCall: #(int32 skia_surface_get_width(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primReadAllPixels: aBoxerArrayU8 [
	^ self ffiCall: #(bool skia_surface_read_all_pixels(self, GtBoxerArrayU8 aBoxerArrayU8))
]
