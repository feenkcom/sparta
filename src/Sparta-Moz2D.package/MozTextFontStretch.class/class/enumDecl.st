enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		ULTRA_CONDENSED -4
		EXTRA_CONDENSED -3
		CONDENSED       -2
		SEMI_CONDENSED  -1
		NORMAL          0
		SEMI_EXPANDED   1
		EXPANDED        2
		EXTRA_EXPANDED  3
		ULTRA_EXPANDED  4
	)