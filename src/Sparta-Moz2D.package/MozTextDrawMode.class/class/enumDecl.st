enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		"GLYPH_FILL and GLYPH_STROKE draw into the current context
		and may be used together with bitwise OR."
		GLYPH_FILL 1
		GLYPH_STROKE 2
		"Appends glyphs to the current path. Can NOT be used with
		GLYPH_FILL or GLYPH_STROKE."
		GLYPH_PATH 4
		"When GLYPH_FILL and GLYPH_STROKE are both set, draws the
		stroke underneath the fill."
		GLYPH_STROKE_UNDERNEATH 8
	)