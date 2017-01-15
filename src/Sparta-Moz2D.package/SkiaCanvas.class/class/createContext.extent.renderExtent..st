instance creation
createContext: aGrContext extent: anExtent renderExtent: aRenderExtent

	^ self
		createContext: aGrContext
		extent: anExtent
		renderExtent: aRenderExtent
		format: MozSurfaceFormat B8G8R8A8