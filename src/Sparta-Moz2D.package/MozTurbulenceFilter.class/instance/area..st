accessing
area: aRectangle
	"Area to be filled with noise"
	self
		primSetAttributeIntRectX: aRectangle left rounded
		y: aRectangle top rounded
		width: aRectangle width rounded
		height: aRectangle height rounded
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_RECT