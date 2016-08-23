accessing
fill
	drawMode	ifNil: [ drawMode := 0 ].
	drawMode := drawMode | (MozTextDrawMode GLYPH_FILL value)