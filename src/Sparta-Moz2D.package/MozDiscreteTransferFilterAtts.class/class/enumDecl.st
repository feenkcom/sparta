enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_DISCRETE_TRANSFER_TABLE_R 4 	"Float[]"
		ATT_DISCRETE_TRANSFER_TABLE_G 5 	"Float[]"
		ATT_DISCRETE_TRANSFER_TABLE_B 6 	"Float[]"
		ATT_DISCRETE_TRANSFER_TABLE_A 7 	"Float[]"
	)