initialization
setUp
	super setUp.
	
	canvas := MozCanvas
		createType: MozBackendType SKIA
		extent: self defaultExtent
		format: MozSurfaceFormat B8G8R8A8