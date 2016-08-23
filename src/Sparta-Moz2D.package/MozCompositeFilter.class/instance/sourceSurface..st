dispatch
sourceSurface: aSurface
	self primSetInputSurface: aSurface intIndex: self size.
	"We need to have a strong reference to aSurface to prevent external
	object from automatic garbage collection"
	self sources add: aSurface