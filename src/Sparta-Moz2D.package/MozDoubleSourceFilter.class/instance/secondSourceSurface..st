dispatch
secondSourceSurface: aSurface
	self primSetInputSurface: aSurface index: MozFilterInputs SECOND_INPUT.
	"we need to have a strong reference to prevent aSurface external object
	from being automatically garbage collected"
	secondSource := aSurface