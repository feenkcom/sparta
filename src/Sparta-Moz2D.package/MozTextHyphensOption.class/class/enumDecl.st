enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		NONE   0
		MANUAL 1
		AUTO   2
	)