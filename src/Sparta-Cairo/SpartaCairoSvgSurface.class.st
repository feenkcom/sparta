Class {
	#name : #SpartaCairoSvgSurface,
	#superclass : #SpartaCairoSurface,
	#instVars : [
		'extent'
	],
	#category : 'Sparta-Cairo'
}

{ #category : #'instance creation' }
SpartaCairoSvgSurface class >> createExtent: anExtent fileNamed: aFileNameString [
	| aFileReference |

	aFileReference := aFileNameString asFileReference.
	
	^ (self
		primCreateWidth: anExtent x
		height: anExtent y
		fileName: aFileReference fullName)
			extent: anExtent;
			autoRelease
]

{ #category : #'private - ffi' }
SpartaCairoSvgSurface class >> primCreateWidth: aWidth height: aHeight fileName: aFileName [

	^ self ffiCall: #(SpartaCairoSvgSurface cairo_svg_surface_create (
		String aFileName,
		double aWidth,
		double aHeight) )
]

{ #category : #accessing }
SpartaCairoSvgSurface >> extent [
	<return: #Point>

	^ extent
]

{ #category : #accessing }
SpartaCairoSvgSurface >> extent: aPoint [
	extent := aPoint
]
