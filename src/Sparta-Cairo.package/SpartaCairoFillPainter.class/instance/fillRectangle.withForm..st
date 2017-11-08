drawing
fillRectangle: aRectangle withForm: aForm
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self fillRectangle: aRectangle withSurface: aSurfacePaint