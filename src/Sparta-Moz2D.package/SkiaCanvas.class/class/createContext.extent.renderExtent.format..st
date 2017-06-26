instance creation
createContext: aGrContext extent: anExtent renderExtent: aRenderExtent format: aSurfaceFormat

	^ (self
		primCreateContext: aGrContext
		width: anExtent x
		height: anExtent y
		renderWidth: aRenderExtent x
		renderHeight: aRenderExtent y
		format: aSurfaceFormat)
			autoRelease;
			context: aGrContext;
			yourself