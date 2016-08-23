enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		NONE 0
		DIRECT2D 1
		COREGRAPHICS 2
		COREGRAPHICS_ACCELERATED 3
		CAIRO 4
		SKIA 5
		RECORDING 6
		DIRECT2D1_1 7
		SKIA_GL 8
	)