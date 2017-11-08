drawing
fillPath: aPath withForm: aForm
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self fillPath: aPath withSurface: aSurfacePaint