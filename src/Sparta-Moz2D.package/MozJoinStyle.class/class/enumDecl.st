enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
	BEVEL 0
	ROUND 1
	MITER 2   "Mitered if within the miter limit, else, if the backed supports
				  it (D2D), the miter is clamped. If the backend does not support
				  miter clamping the behavior is as for MITER_OR_BEVEL."
	MITER_OR_BEVEL 3 "Mitered if within the miter limit, else beveled."
	)