*Sparta-Moz2D
newMozGLRenderer
	^ renderer := MozOSWindowGLRenderer new 
		window: self;
		createContext;
		yourself