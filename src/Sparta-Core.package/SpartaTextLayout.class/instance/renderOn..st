rendering
renderOn: aCanvas
	| renderer |
	lines ifNil: [ self initializeOn: aCanvas ].
	renderer := SpartaTextRenderer new layout: self.
	renderer renderOn: aCanvas