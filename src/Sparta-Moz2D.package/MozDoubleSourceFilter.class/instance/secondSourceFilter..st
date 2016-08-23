dispatch
secondSourceFilter: aFilter
	self primSetInputFilter: aFilter index: MozFilterInputs SECOND_INPUT.
	"we need to have a strong reference to prevent aFilter external object
	from being automatically garbage collected"
	secondSource := aFilter