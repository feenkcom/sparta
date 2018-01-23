drawing
strokeLine: aLine with: aBlock 

	self
		applyDrawOptions;
		applyStrokeOptions;
		primSetFillRule: SpartaCairoFillRule CAIRO_FILL_RULE_WINDING;
		primNewPath;
		primMoveToX: aLine from x Y: aLine from y;
		primLineToX: aLine to x Y: aLine to y.

	aBlock value.
	self stroke.

	self restoreStrokeOptions.
	self restoreDrawOptions