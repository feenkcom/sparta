drawing
strokeLine: aLine with: aBlock 

	self
		applyDrawOptions;
		applyStrokeOptions;
		primNewPath;
		primMoveToX: aLine from x Y: aLine from y;
		primLineToX: aLine to x Y: aLine to y.

	aBlock value.
	self stroke.

	self restoreStrokeOptions.
	self restoreDrawOptions