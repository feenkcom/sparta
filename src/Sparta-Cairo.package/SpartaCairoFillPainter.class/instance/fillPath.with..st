drawing
fillPath: aPath with: aBlock

	self
		applyDrawOptions;
		primNewPath;
		primAppendPath: aPath.
	
	aBlock value.
	self fill.

	self restoreDrawOptions