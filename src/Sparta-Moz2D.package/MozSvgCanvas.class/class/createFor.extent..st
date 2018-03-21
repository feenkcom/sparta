instance creation
createFor: aFileName extent: aPoint
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