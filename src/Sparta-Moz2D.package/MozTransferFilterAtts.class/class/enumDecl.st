enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_TRANSFER_DISABLE_R 0 	"bool"
		ATT_TRANSFER_DISABLE_G 1 	"bool"
		ATT_TRANSFER_DISABLE_B 2 	"bool"
		ATT_TRANSFER_DISABLE_A 3 	"bool"
	)