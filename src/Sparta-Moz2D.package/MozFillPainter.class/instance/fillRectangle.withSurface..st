drawing
fillRectangle: aRectangle withSurface: aSpartaSurfacePaint
	| aPattern |
	aSpartaSurfacePaint translateBy: aRectangle origin.
	
	aPattern := canvas pattern surface: aSpartaSurfacePaint.
	self fillRectangle: aRectangle withPattern: aPattern.
	aPattern release.

	aSpartaSurfacePaint translateBy: aRectangle origin negated