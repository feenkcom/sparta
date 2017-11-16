drawing
fillPath: aPath withSurface: aSpartaSurfacePaint
	| anOrigin |
	anOrigin := (aPath strokedBoundsOn: self canvas with: MozStrokeOptions default) origin.
	aSpartaSurfacePaint translateBy: anOrigin.
	self fillPath: aPath withPattern: aSpartaSurfacePaint.
	aSpartaSurfacePaint translateBy: anOrigin negated