enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		GOOD 0
		LINEAR 1
		POINT 2
		SENTINEL 3
	)