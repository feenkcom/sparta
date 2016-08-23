accessing
strokeBelow
	self stroke.
	drawMode := drawMode | (MozTextDrawMode GLYPH_STROKE_UNDERNEATH value)