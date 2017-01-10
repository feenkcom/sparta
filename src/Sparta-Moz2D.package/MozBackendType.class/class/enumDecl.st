enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		NONE 0
		DIRECT2D 1 "Used for version independent D2D objects."
		CAIRO 2
		SKIA 3
		RECORDING 4
		DIRECT2D1_1 5
	)