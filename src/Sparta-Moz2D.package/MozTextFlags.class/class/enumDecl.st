enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		TEXT_ENABLE_SPACING 			16r0008
		TEXT_ENABLE_HYPHEN_BREAKS 	16r0010
		TEXT_NEED_BOUNDING_BOX 		16r0040
	)