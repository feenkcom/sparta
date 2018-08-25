Class {
	#name : #SpartaCairoSurfacePattern,
	#superclass : #SpartaCairoPattern,
	#category : 'Sparta-Cairo-External'
}

{ #category : #'private - ffi' }
SpartaCairoSurfacePattern class >> primCreateSurface: aCairoSurface [

	^ self ffiCall: #(SpartaCairoSurfacePattern cairo_pattern_create_for_surface ( SpartaCairoSurface aCairoSurface ) )
]

{ #category : #'instance creation' }
SpartaCairoSurfacePattern class >> surface: aCairoSurface [

	^ (self primCreateSurface: aCairoSurface)
		autoRelease
]
