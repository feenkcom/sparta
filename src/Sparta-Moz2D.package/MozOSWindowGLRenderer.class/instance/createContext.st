misc
createContext
	self onRenderThreadBlocking: [
		| screenFB readFB |
		context := SDL2 glCreateContext: window handle.
		sdlSurface := window handle getWindowSurface.
		glContext := MozCanvas primGlGetGlobalContext.
		skiaGlue := MozCanvas primGlCreateSkiaGlue: glContext getHandle.
		spartaCanvas := MozCanvas
			primGlCreateSkiaDrawTarget: skiaGlue getHandle
			width: window extent x
			height: window extent y
			format: MozSurfaceFormat B8G8R8A8.

		screenFB := MozCanvas primGlGetScreen: glContext getHandle.
		"readFB := MozCanvas primGlScreenGetReadFB: screenFB getHandle."
		
	]