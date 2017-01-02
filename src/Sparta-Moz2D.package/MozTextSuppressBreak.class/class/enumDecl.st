enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		eNoSuppressBreak 0 
		eSuppressInitialBreak 1 "Measure the range of text as if there is no break before it."
		eSuppressAllBreaks 2 "Measure the range of text as if it contains no break"
	)