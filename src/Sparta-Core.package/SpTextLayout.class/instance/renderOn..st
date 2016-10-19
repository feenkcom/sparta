rendering
renderOn: aCanvas
	| renderer |
	lines ifNil: [ self initializeOn: aCanvas ].
	renderer := SpTextRenderer new layout: self.
	renderer renderOn: aCanvas