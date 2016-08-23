enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
	ATT_TURBULENCE_BASE_FREQUENCY 0  "Size"
	ATT_TURBULENCE_NUM_OCTAVES 1     "uint32_t"
	ATT_TURBULENCE_SEED 2            "uint32_t"
	ATT_TURBULENCE_STITCHABLE 3      "bool"
	ATT_TURBULENCE_TYPE 4            "TurbulenceType"
	ATT_TURBULENCE_RECT 5            "IntRect"
	)