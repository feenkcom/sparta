enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		EDGE_MODE_DUPLICATE 0
		EDGE_MODE_WRAP 1
		EDGE_MODE_NONE 2
	)