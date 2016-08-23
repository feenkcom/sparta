dispatch
sourceFilter: aFilter
	self primSetInputFilter: aFilter intIndex: self size.
	"We need to have a strong reference to aFilter to prevent external
	object from automatic garbage collection"
	self sources add: aFilter