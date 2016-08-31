tests - antialias
testAntialiasMode
	"Smoke test to make sure that all possible antialias modes are settable"
	|modes|
	
	modes := MozAntialiasMode enumerationDictionary
		collect: [ :i | MozAntialiasMode fromInteger: i ].

	modes do: [ :mode |
		drawOptions antialiasMode: mode.
		self assert: drawOptions antialiasMode equals: mode ]