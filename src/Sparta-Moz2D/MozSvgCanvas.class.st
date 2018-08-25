Class {
	#name : #MozSvgCanvas,
	#superclass : #MozCanvas,
	#instVars : [
		'svgSurface'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #'instance creation' }
MozSvgCanvas class >> createFor: aFileName extent: aPoint [
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

	aCanvas svgSurface: aSurface.
	aCanvas initialize.
	aCanvas autoRelease.
	
	^ aCanvas
]

{ #category : #'private - ffi' }
MozSvgCanvas class >> primCreateSurfaceWidth: aWidth height: aHeight fileName: aFileName [

	^ self ffiCall: #(void* moz2d_draw_target_create_cairo_surface_for_svg (
		String aFileName,
		double aWidth,
		double aHeight) )
]

{ #category : #'private - ffi' }
MozSvgCanvas class >> primCreateWidth: aWidth height: aHeight surface: aCairoSurface format: aSurfaceFormat [

	^ self ffiCall: #(MozSvgCanvas moz2d_draw_target_create_for_cairo_surface (
		void* aCairoSurface,
		int32 aWidth,
		int32 aHeight,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #'private - ffi' }
MozSvgCanvas class >> primSurfaceDestroy: aHandle [

	^ self ffiCall: #(void moz2d_draw_target_cairo_surface_destroy (void* aHandle))
]

{ #category : #override }
MozSvgCanvas >> compose: aSymbol during: aBlock [
	aBlock value
]

{ #category : #accessing }
MozSvgCanvas >> flush [
	self isValid
		ifFalse: [ self error: 'Svg canvas is no more valid. Create a new one' ].

	super flush.

	self class primSurfaceDestroy: self svgSurface.
	self release
]

{ #category : #accessing }
MozSvgCanvas >> svgSurface [
	^ svgSurface
]

{ #category : #accessing }
MozSvgCanvas >> svgSurface: anObject [
	svgSurface := anObject
]
