enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		eNoSuppressBreak 0 "Measure the range of text as if there is no break before it."
		eSuppressInitialBreak 1 
		eSuppressAllBreaks 2 "Measure the range of text as if it contains no break"
	)