dispatch
sourceFilter: aFilter
	self primSetInputFilter: aFilter index: MozFilterInputs INPUT.
	"we need to have a strong reference to prevent aFilter external object
	from being automatically garbage collected"
	source := aFilter