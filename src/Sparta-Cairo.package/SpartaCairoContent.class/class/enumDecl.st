enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_CONTENT_COLOR 16r1000
		CAIRO_CONTENT_ALPHA 16r2000
		CAIRO_CONTENT_COLOR_ALPHA 16r3000
	)