dispatch
secondSourceFilter: aFilter

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter index: MozFilterInputs SECOND_INPUT