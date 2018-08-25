Class {
	#name : #SpartaCairoImageSurface,
	#superclass : #SpartaCairoSurface,
	#category : 'Sparta-Cairo'
}

{ #category : #'instance creation' }
SpartaCairoImageSurface class >> createExtent: anExtent format: aSurfaceFormat [

	^ (self
		primCreateWidth: anExtent x
		height: anExtent y
		format: aSurfaceFormat) autoRelease
]

{ #category : #'instance creation' }
SpartaCairoImageSurface class >> createForData: aData extent: aPoint stride: stride format: aSurfaceFormat [

	^ (self
		primCreateForData: aData
		width: aPoint x
		height: aPoint y
		stride: stride
		format: aSurfaceFormat) autoRelease
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface class >> primCreateForData: aData width: width height: height stride: stride format: aSurfaceFormat [

	^ self ffiCall: #( SpartaCairoImageSurface cairo_image_surface_create_for_data (
		void* aData,
		SpartaCairoSurfaceFormat aSurfaceFormat,
		int width,
		int height,
		int stride) )
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface class >> primCreateWidth: aWidth height: aHeight format: aSurfaceFormat [

	^ self ffiCall: #(SpartaCairoImageSurface cairo_image_surface_create (
		SpartaCairoSurfaceFormat	aSurfaceFormat,
		int	 aWidth,
		int	 aHeight ) )
]

{ #category : #converting }
SpartaCairoImageSurface >> asForm [
	| theData aBitmap |
	
	self flush.

	self format = SpartaCairoSurfaceFormat CAIRO_FORMAT_ARGB32
		ifFalse: [ self error: 'Only ARGB32 is supported' ].

	theData := FFIExternalArray fromHandle: self primData getHandle type: FFIUInt32 size: self primHeight * self primStride / 4.
	aBitmap := Bitmap newFrom: theData.
	^ Form extent: self extent depth: 32 bits: aBitmap
]

{ #category : #accessing }
SpartaCairoImageSurface >> extent [
	^ self primWidth @ self primHeight
]

{ #category : #accessing }
SpartaCairoImageSurface >> format [

	^ self primFormat
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface >> primData [

	^ self ffiCall: #(uchar* cairo_image_surface_get_data ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface >> primFormat [

	^ self ffiCall: #(SpartaCairoSurfaceFormat cairo_image_surface_get_format (self) )
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface >> primHeight [

	^ self ffiCall: #(int cairo_image_surface_get_height ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface >> primStride [

	^ self ffiCall: #(int cairo_image_surface_get_stride ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoImageSurface >> primWidth [

	^ self ffiCall: #(int cairo_image_surface_get_width ( self ) )
]

{ #category : #accessing }
SpartaCairoImageSurface >> stride [
	^ self primStride
]
