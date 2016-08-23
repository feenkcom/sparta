instance creation
for: aWindowHandle

	^ self new 
		window: aWindowHandle;
		checkSession;
		createSDLSurface;
		createSpartaCanvas;
		yourself.