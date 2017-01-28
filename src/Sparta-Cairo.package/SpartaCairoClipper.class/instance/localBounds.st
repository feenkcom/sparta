geometry
localBounds
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
	
	^ aRectangle