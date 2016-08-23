instance creation
extent: aPoint
	^ (self
		primCreateWidth: aPoint x
		height: aPoint y
		format: MozSurfaceFormat A8R8G8B8_UINT32) autoRelease