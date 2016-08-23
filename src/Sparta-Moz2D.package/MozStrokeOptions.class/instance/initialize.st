initialization
initialize
	super initialize.
	
	"To handle lifecycle of external object"
	self autoRelease.

	"Setting default values according to backend specification"
	self width: 1.0.
	self joinMiterOrBevel.
	self capButt.
	self miterLimit: 10.0.
	self dashOffset: 0.
	self dashPattern: #()