initialization
initialize
	super initialize.


	"Setting default values according to backend specification"
	self width: self class defaultWidth.
	self joinMiterOrBevel.
	self capButt.
	self miterLimit: 10.0.
	self dashOffset: 0.
	self dashPattern: #()