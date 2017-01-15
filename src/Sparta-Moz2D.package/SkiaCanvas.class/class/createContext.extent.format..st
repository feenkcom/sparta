instance creation
createContext: aGrContext extent: aPoint format: aSurfaceFormat

	^ (self
		primCreateContext: aGrContext
		width: aPoint x
		height: aPoint y
		format: aSurfaceFormat
		headless: aGrContext isHeadless) autoRelease