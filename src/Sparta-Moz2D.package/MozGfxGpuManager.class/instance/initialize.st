initialization
initialize
	"Do not send super initialize, otherwise handle is reset to 0"
	
	self autoRelease.
	self initializeDevices