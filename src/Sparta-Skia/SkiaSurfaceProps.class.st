Class {
	#name : #SkiaSurfaceProps,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaSurfaceProps class >> primCreate [
	^ self ffiCall: #(void* skia_surface_props_default())
]

{ #category : #'private - ffi' }
SkiaSurfaceProps class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_surface_props_drop(void* aHandle))
]

{ #category : #accessing }
SkiaSurfaceProps >> flags [
	<return: #Number>
	
	^ self primGetFlags
]

{ #category : #accessing }
SkiaSurfaceProps >> pixelGeometry [
	<return: #SkiaPixelGeometry>
	
	^ self primGetPixelGeometry
]

{ #category : #'private - ffi' }
SkiaSurfaceProps >> primGetFlags [
	^ self ffiCall: #(uint32 skia_surface_props_get_flags(self))
]

{ #category : #'private - ffi' }
SkiaSurfaceProps >> primGetPixelGeometry [
	^ self ffiCall: #(SkiaPixelGeometry skia_surface_props_get_pixel_geometry(self))
]

{ #category : #printing }
SkiaSurfaceProps >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' flags: ';
		print: self flags.
	aStream
		nextPutAll: ' pixelGeometry: ';
		print: self pixelGeometry
]
