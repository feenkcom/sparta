Class {
	#name : #SpartaCairoSurface,
	#superclass : #FFIExternalObject,
	#traits : 'TSpartaCairoLibrary + TSpartaSurface + TSpartaCairoRefPtr + TSpartaCairoDebug',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaSurface classTrait + TSpartaCairoRefPtr classTrait + TSpartaCairoDebug classTrait',
	#category : 'Sparta-Cairo'
}

{ #category : #'private - ffi' }
SpartaCairoSurface class >> primAddRef: aHandle [

	^ self ffiCall: #(void* cairo_surface_reference ( void* surface ) )
]

{ #category : #'private - ffi' }
SpartaCairoSurface class >> primRefCount: aHandle [

	^ self ffiCall: #(uint cairo_surface_get_reference_count (void* aHandle) )
]

{ #category : #finalization }
SpartaCairoSurface class >> primRelease: aHandle [

	^ self ffiCall: #(void cairo_surface_destroy (void* aHandle) )
]

{ #category : #converting }
SpartaCairoSurface >> asForm [

	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaCairoSurface >> flush [

	self primFlush
]

{ #category : #accessing }
SpartaCairoSurface >> markDirty [
	self primMarkDirty
]

{ #category : #'private - ffi' }
SpartaCairoSurface >> primFlush [

	^ self ffiCall: #(void cairo_surface_flush ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoSurface >> primMarkDirty [
	
	^ self ffiCall: #(void cairo_surface_mark_dirty (self) )
]

{ #category : #'private - ffi' }
SpartaCairoSurface >> primStatus [
	^ self ffiCall: #(SpartaCairoStatus cairo_surface_status (self))
]

{ #category : #accessing }
SpartaCairoSurface >> stride [
	^ self subclassResponsibility
]
