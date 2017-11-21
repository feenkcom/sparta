initialization
initialize
	"Do not send super initialize, otherwise handle is reset to 0"

	self initializeCallbacks.

	hyphenWidth := 0.0.
	spacing := 0.0