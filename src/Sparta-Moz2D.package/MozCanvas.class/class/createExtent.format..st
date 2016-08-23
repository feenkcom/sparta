instance creation
createExtent: aPoint format: aSurfaceFormat
	^ (self
		primCreateWidth: aPoint x
		height: aPoint y
		format: aSurfaceFormat) autoRelease