enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		eNoBreak       0
		eWordWrapBreak 1
		eNormalBreak   2
	)