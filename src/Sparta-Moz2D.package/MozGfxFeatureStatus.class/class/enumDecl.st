enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		Unused 0
		Unavailable 1
		CrashedInHandler 2
		Blocked 3
		Blacklisted 4
		Failed 5
		Disabled 6
		Available 7
		ForceEnabled 8
		CrashedOnStartup 9
		Broken 10)