Class {
	#name : #SpartaCairoClipper,
	#superclass : #SpartaClipper,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoContext',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoContext classTrait',
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #testing }
SpartaCairoClipper >> containsGlobal: aRectangle [
	<return: #Boolean>

	^ self globalBounds intersects: aRectangle
]

{ #category : #testing }
SpartaCairoClipper >> containsLocal: aRectangle [
	<return: #Boolean>

	^ self localBounds intersects: aRectangle
]

{ #category : #geometry }
SpartaCairoClipper >> globalBounds [
	| aTransformation aBounds |
	
	aTransformation := canvas transform current.
	aBounds := self localBounds.
	aTransformation transformRectangle: aBounds.
	^ aBounds
]

{ #category : #geometry }
SpartaCairoClipper >> localBounds [
	<return: #Rectangle>
	| anOriginX anOriginY aCornerX aCornerY aDoubleSize aRectangle |

	aDoubleSize := (FFIExternalType resolveType: 'double') externalTypeSize.
	anOriginX := ExternalAddress allocate: aDoubleSize.
	anOriginY := ExternalAddress allocate: aDoubleSize.
	aCornerX := ExternalAddress allocate: aDoubleSize.
	aCornerY := ExternalAddress allocate: aDoubleSize.
	
	self primGetClipOriginX: anOriginX originY: anOriginY cornerX: aCornerX cornerY: aCornerY.

	aRectangle := SpartaRectangle new
		left: (anOriginX doubleAt: 1)
		top: (anOriginY doubleAt: 1)
		right: (aCornerX doubleAt: 1)
		bottom: (aCornerY doubleAt: 1).
		
	anOriginX free.
	anOriginY free.
	aCornerX free.
	aCornerY free.
	
	^ aRectangle asRectangle
]

{ #category : #clipping }
SpartaCairoClipper >> pop [

	self primRestore
]

{ #category : #clipping }
SpartaCairoClipper >> pushPath: aPath [

	self primSave.
		
	aPath setOnCanvas: self canvas.

	self primClipPreserve
]

{ #category : #clipping }
SpartaCairoClipper >> pushRectangle: aRectangle [

	self
		primSave;
		primSetFillRule: SpartaCairoFillRule CAIRO_FILL_RULE_WINDING;
		primNewPath;
		primRectangleX: aRectangle left Y: aRectangle top width: aRectangle width height: aRectangle height;
		primClipPreserve
]
