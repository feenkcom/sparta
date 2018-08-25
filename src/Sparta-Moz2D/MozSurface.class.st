Class {
	#name : #MozSurface,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TSpartaSurface + TSpartaInspectorPreview + TMozRefPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TSpartaSurface classTrait + TSpartaInspectorPreview classTrait + TMozRefPtr classTrait + TMozDebug classTrait',
	#pools : [
		'MozSharedPool'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #converting }
MozSurface >> asColor: aColor [
	"Transform all non transparent pixels to a given color"
	<return: #MozSurface>

	^ (self
		primToColorR: (aColor red * 255) rounded
		G: (aColor green * 255) rounded
		B: (aColor blue * 255) rounded
		A: (aColor alpha * 255) rounded)
			autoRelease
]

{ #category : #converting }
MozSurface >> asForm [
	| aCanvas |
	aCanvas := MozCanvas extent: self extent.
	aCanvas fill
		paint: self;
		path: (0@0 extent: aCanvas extent);
		draw.
	^ aCanvas asPureForm
]

{ #category : #converting }
MozSurface >> asOpaque [
	"Convert me to opaque surface"
	<return: #MozSurface>

	^ self primToOpaque autoRelease
]

{ #category : #accessing }
MozSurface >> extent [
	|intSize|
	intSize := MozNativeIntSize new.
	self primGetSize: intSize.
	^ intSize asPoint
]

{ #category : #accessing }
MozSurface >> format [
	^ self primGetFormat
]

{ #category : #'private - ffi' }
MozSurface >> primGetFormat [

	^ self ffiCall: #(MozSurfaceFormat moz2d_source_surface_get_format ( self ))
]

{ #category : #'private - ffi' }
MozSurface >> primGetSize: anIntSize [

	^ self ffiCall: #(void moz2d_source_surface_get_size ( self, MozNativeIntSize anIntSize ))
]

{ #category : #'private - ffi' }
MozSurface >> primGetType [

	^ self ffiCall: #(MozSurfaceType moz2d_source_surface_get_type ( self ))
]

{ #category : #'private - ffi' }
MozSurface >> primMap: aDataSurface retStride: aRetStride [

	^ self ffiCall: #(uint8 * moz2d_source_surface_map(MozSurface aDataSurface, void* aRetStride))
]

{ #category : #'private - ffi' }
MozSurface >> primToColorR: r G: g B: b A: a [

	^ self ffiCall: #(MozSurface moz2d_source_surface_to_color (
		self,
		uint8 r,
		uint8 g,
		uint8 b,
		uint8 a ))
]

{ #category : #'private - ffi' }
MozSurface >> primToOpaque [

	^ self ffiCall: #(MozSurface moz2d_source_surface_to_opaque ( self ))
]

{ #category : #'private - ffi' }
MozSurface >> primUnmap: aDataSource [

	^ self ffiCall: #(void moz2d_source_surface_unmap(MozSurface aDataSource))
]

{ #category : #printing }
MozSurface >> printOn: aStream [

	handle isNull
		ifTrue: [ ^ aStream nextPutAll: 'nullptr'; cr ].

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'extent: ', self extent asString; cr.
	aStream tab; nextPutAll: 'type: ', self type item asString; cr.
	aStream tab; nextPutAll: 'format: ', self format item asString; cr.
	aStream tab; nextPutAll: 'handle: ', handle asString; cr.
	aStream tab; nextPutAll: 'refCount: ', self refCount asString; cr.
	aStream nextPutAll: ')'; cr.
]

{ #category : #accessing }
MozSurface >> type [

	^ self primGetType
]
