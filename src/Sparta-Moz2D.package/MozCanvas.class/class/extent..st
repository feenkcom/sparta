instance creation
extent: aPoint
	^ (self
		primCreateWidth: aPoint x
		height: aPoint y
		format: MozSurfaceFormat B8G8R8A8)
			initialize;
			autoRelease