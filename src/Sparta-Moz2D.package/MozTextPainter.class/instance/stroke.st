accessing
stroke
	drawMode	ifNil: [ drawMode := 0 ].
	drawMode := drawMode | (MozTextDrawMode GLYPH_STROKE value)