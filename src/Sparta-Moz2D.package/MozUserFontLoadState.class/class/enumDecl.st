enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		STATUS_NOT_LOADED 0
		STATUS_LOADING 1 
		STATUS_LOADED 2
		STATUS_FAILED 3
	)