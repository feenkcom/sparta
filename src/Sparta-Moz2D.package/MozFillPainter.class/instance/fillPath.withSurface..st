drawing
fillPath: aPath withSurface: aSpartaSurfacePaint
	| anOrigin |
	anOrigin := aPath bounds origin.
	aSpartaSurfacePaint translateBy: anOrigin.
	self fillPath: aPath withPattern: aSpartaSurfacePaint.
	aSpartaSurfacePaint translateBy: anOrigin negated