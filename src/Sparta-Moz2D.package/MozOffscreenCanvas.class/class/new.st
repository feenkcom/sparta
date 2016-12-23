instance creation
new
	^ self basicNew
		initializeWith: (self
			primCreateWidth: 1
			height: 1
			format: MozSurfaceFormat B8G8R8A8) getHandle;
		autoRelease;
		yourself