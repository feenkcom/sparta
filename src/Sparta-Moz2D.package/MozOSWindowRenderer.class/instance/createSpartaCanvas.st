initialization
createSpartaCanvas
	spartaCanvas := MozCanvas
		createForData: sdlSurface pixels
		extent: sdlSurface w @ sdlSurface h
		stride: sdlSurface pitch
		format: MozSurfaceFormat B8G8R8A8