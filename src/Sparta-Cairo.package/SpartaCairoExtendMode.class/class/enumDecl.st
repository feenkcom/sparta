enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_EXTEND_NONE 0
		CAIRO_EXTEND_REPEAT 1
		CAIRO_EXTEND_REFLECT 2
		CAIRO_EXTEND_PAD 3
	)