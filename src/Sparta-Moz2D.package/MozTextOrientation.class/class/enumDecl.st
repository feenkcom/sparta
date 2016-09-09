enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		HORIZONTAL              16r0000
		VERTICAL_UPRIGHT        16r1000
		VERTICAL_SIDEWAYS_RIGHT 16r2000
		VERTICAL_SIDEWAYS_LEFT  16r4000
		VERTICAL_MIXED          16r8000
	)