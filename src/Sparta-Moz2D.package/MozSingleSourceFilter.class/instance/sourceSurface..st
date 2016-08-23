dispatch
sourceSurface: aSurface
	self primSetInputSurface: aSurface index: MozFilterInputs INPUT.
	"we need to have a strong reference to prevent aSurface external object
	from being automatically garbage collected"
	source := aSurface