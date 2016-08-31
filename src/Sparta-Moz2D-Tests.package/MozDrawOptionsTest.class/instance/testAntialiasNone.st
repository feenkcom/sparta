tests - antialias
testAntialiasNone

	drawOptions antialiasNone.
	
	self assert: drawOptions antialiasMode equals: MozAntialiasMode NONE