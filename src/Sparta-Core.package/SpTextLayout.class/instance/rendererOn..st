rendering
rendererOn: aCanvas
	| renderer |
	lines ifNil: [ self initializeOn: aCanvas ].
	renderer := SpTextRenderer new layout: self.
	^ renderer