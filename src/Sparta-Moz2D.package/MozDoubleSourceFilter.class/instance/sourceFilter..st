dispatch
sourceFilter: aFilter

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter index: MozFilterInputs INPUT