enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
	CLAMP 0 "Do not repeat"
	REPEAT  1 "Repeat in both axis"
	REPEAT_X 2 "Only X axis"
	REPEAT_Y 3 "Only Y axis"
	REFLECT 4 "Mirror the image"
	)