drawing
fillRectangle: aRectangle withSurface: aSpartaSurfacePaint

	aSpartaSurfacePaint translateBy: aRectangle origin.
	self fillRectangle: aRectangle withPattern: aSpartaSurfacePaint.
	aSpartaSurfacePaint translateBy: aRectangle origin negated