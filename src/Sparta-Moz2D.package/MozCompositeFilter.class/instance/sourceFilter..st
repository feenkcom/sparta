dispatch
sourceFilter: aFilter

	"Filters are ref counted, so no need to strong refer them"
	self primSetInputFilter: aFilter intIndex: self size.

	"increase counter by one"
	count := count + 1