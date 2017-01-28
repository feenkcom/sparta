drawing
fillRectangle: aRectangle with: aBlock 

	self
		applyDrawOptions;
		primNewPath;
		primRectangleX: aRectangle left Y: aRectangle top width: aRectangle width height: aRectangle height.
	
	aBlock value.
	self fill.

	self restoreDrawOptions