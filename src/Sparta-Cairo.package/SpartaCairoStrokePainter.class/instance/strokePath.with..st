drawing
strokePath: aPath with: aBlock

	self
		applyDrawOptions;
		applyStrokeOptions.
		
	aPath setOnCanvas: self canvas.
	
	aBlock value.
	self stroke.
	
	self restoreStrokeOptions.
	self restoreDrawOptions