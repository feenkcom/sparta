drawing
strokePath: aPath with: aBlock

	self
		applyDrawOptions;
		applyStrokeOptions;
		primNewPath;
		primAppendPath: aPath.
	
	aBlock value.
	self stroke.
	
	self restoreStrokeOptions.
	self restoreDrawOptions