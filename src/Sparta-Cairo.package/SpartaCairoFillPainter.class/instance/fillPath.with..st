drawing
fillPath: aPath with: aBlock

	self
		applyDrawOptions.

	aPath setOnCanvas: self canvas.
	
	aBlock value.
	self fill.

	self restoreDrawOptions