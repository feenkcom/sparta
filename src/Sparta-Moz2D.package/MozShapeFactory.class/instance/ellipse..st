shapes
ellipse: aRectangle

	^ (self
		primEllipseX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		fillRule: MozFillRule FILL_WINDING)
			initialize;
			autoRelease