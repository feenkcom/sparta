initialization
initialize
	super initialize.
	
	"To handle lifecycle of external object"
	self autoRelease.

	"Setting default values according to backend specification"
	self alpha: 1.
	self antialiasDefault.
	self composeOver