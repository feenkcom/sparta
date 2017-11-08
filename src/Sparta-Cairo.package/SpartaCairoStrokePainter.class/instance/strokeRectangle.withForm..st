drawing
strokeRectangle: aRectangle withForm: aForm
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self strokeRectangle: aRectangle withSurface: aSurfacePaint