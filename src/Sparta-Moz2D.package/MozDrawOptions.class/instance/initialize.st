initialization
initialize
	super initialize.
	
	"To handle lifecycle of external object"
	self autoRelease.
	self reset