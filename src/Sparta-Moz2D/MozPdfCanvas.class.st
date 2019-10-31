Class {
	#name : #MozPdfCanvas,
	#superclass : #MozCanvas,
	#instVars : [
		'pdfSurface'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #'instance creation' }
MozPdfCanvas class >> createFor: aFileName extent: aPoint [
	| aSurface aCanvas |
	
	aSurface := self
		primCreateSurfaceWidth: aPoint x
		height: aPoint y
		fileName: aFileName asFileReference fullName.
		
	aCanvas := self
		primCreateWidth: aPoint x
		height: aPoint y
		surface: aSurface
		format: MozSurfaceFormat B8G8R8A8.

	aCanvas pdfSurface: aSurface.
	aCanvas initialize.
	aCanvas autoRelease.
	
	^ aCanvas
]

{ #category : #'private - ffi' }
MozPdfCanvas class >> primCreateSurfaceWidth: aWidth height: aHeight fileName: aFileName [

	^ self ffiCall: #(void* moz2d_draw_target_create_cairo_surface_for_pdf (
		String aFileName,
		double aWidth,
		double aHeight) )
]

{ #category : #'private - ffi' }
MozPdfCanvas class >> primCreateWidth: aWidth height: aHeight surface: aCairoSurface format: aSurfaceFormat [

	^ self ffiCall: #(MozPdfCanvas moz2d_draw_target_create_for_cairo_surface (
		void* aCairoSurface,
		int32 aWidth,
		int32 aHeight,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #'private - ffi' }
MozPdfCanvas class >> primSurfaceDestroy: aHandle [

	^ self ffiCall: #(void moz2d_draw_target_cairo_surface_destroy (void* aHandle))
]

{ #category : #override }
MozPdfCanvas >> compose: aSymbol during: aBlock [
	aBlock value
]

{ #category : #accessing }
MozPdfCanvas >> flush [
	self isValid
		ifFalse: [ self error: 'Pdf canvas is no more valid. Create a new one' ].

	super flush.

	self class primSurfaceDestroy: self pdfSurface.
	self release
]

{ #category : #accessing }
MozPdfCanvas >> pdfSurface [
	^ pdfSurface
]

{ #category : #accessing }
MozPdfCanvas >> pdfSurface: anObject [
	pdfSurface := anObject
]
