drawing
strokePath: aPath withForm: aForm
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self strokePath: aPath withSurface: aSurfacePaint