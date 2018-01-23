drawing
strokeRectangle: aRectangle with: aBlock 

	self
		applyDrawOptions;
		applyStrokeOptions;
		primSetFillRule: SpartaCairoFillRule CAIRO_FILL_RULE_WINDING;
		primNewPath;
		primRectangleX: aRectangle left Y: aRectangle top width: aRectangle width height: aRectangle height.
	
	aBlock value.
	self stroke.

	self restoreStrokeOptions.
	self restoreDrawOptions