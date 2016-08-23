enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
	none 0  "used when finding generics"

	"explicitly named font family (e.g. Helvetica)"
	named 1
	namedQuoted 2

	"generics"
	serif 3         "pref font code relies on this ordering!!!"
	sansSerif 4
	monospace 5
	cursive 6
	fantasy 7

	special 8
	variable 9
	fixed 10
	)