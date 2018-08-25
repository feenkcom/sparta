Class {
	#name : #SpartaCairoPdfSurface,
	#superclass : #SpartaCairoSurface,
	#instVars : [
		'extent'
	],
	#category : 'Sparta-Cairo'
}

{ #category : #'instance creation' }
SpartaCairoPdfSurface class >> createExtent: anExtent fileNamed: aFileNameString [
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
SpartaCairoPdfSurface class >> primCreateWidth: aWidth height: aHeight fileName: aFileName [

	^ self ffiCall: #(SpartaCairoPdfSurface cairo_pdf_surface_create (
		String aFileName,
		double aWidth,
		double aHeight) )
]

{ #category : #accessing }
SpartaCairoPdfSurface >> extent [
	<return: #Point>

	^ extent
]

{ #category : #accessing }
SpartaCairoPdfSurface >> extent: aPoint [
	extent := aPoint
]
